class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login
  helper_method :session_location, :has_location?

  def session_location
    @device_location = session[:location]
  end

  def has_location?
    if defined?(session[:location]) && session[:location] != nil
      true
    else
      false
    end
  end

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
