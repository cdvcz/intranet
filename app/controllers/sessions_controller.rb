class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated, only: [ :new, :create ]
  respond_to :json

  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { content: user, authorized: true }
    else
      render json: { authorized: false }
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { authorized: false }
  end
end
