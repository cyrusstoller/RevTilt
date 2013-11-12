class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:login, :username, :email]
  end
end
