class ApplicationController < ActionController::Base
  before_filter :ensure_authenticated

  private

  def ensure_authenticated
    if session[:user_id].blank?
      render :json => { authorized: false }
    end
  end
end
