class ApplicationController < ActionController::Base
#  before_filter :ensure_authenticated, except: [ :start ]

  def start
    render layout: "application", text: ""
  end

  private

  def ensure_authenticated
    if session[:user_id].blank?
      render :json => { authorized: false }
    end
  end
end
