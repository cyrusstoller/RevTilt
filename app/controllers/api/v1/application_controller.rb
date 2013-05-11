class Api::V1::ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    render :text => "Access Forbidden", :status => 403, :layout => false
  end
end