class ApplicationController < ActionController::Base
  before_filter :ensure_authenticated, except: [ :start ]
  rescue_from  CanCan::AccessDenied, with: :access_denied

  def start
    render layout: "application", text: ""
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  private

  def access_denied
    render json: { authorized: false }, status: 403
  end

  def ensure_authenticated
    if session[:user_id].blank?
      render json: { authorized: false }, status: 401
    end
  end
end
