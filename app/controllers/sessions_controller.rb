class SessionsController < ApplicationController
  skip_before_filter :ensure_authenticated, only: [ :create ]

  def create
    user = User.find_by_login_username(params[:login_username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render :json => { content: user, authorized: 'true' }
    else
      render :json => { authorized: 'false' }
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => { authorized: 'false' }
  end
end
