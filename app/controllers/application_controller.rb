class ApplicationController < ActionController::Base
  include CdvSession::Authenticate

  rescue_from  CanCan::AccessDenied, with: :access_denied

  def start
    render layout: "application", text: ""
  end

  private

  def access_denied
    render json: { authorized: false }, status: 403
  end
end
