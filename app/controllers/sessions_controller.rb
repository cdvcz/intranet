class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated, only: [ :new, :create ]
  respond_to :json

  # TODO: presunout nekam do konfigu nebo zjistovat automaticky podle nazvu
  #       korenoveho adresare?
  APPLICATION_CODE = 'intranet'

  def create
    begin
      account = Account.get(:authenticate,
                             login: params[:login],
                             password: params[:password],
                             application_code: APPLICATION_CODE)

      user = User.find_by_id(account["user_id"])

      if user
        session[:user_id] = user.id
        render json: { content: user, authorized: true }
        return
      end
    rescue ActiveResource::UnauthorizedAccess
    end

    render json: { authorized: false }
  end

  def destroy
    session[:user_id] = nil
    render json: { authorized: false }
  end
end
