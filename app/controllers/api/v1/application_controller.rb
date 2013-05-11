class Api::V1::ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :allow_origin_multiple_origin_domains
  
  rescue_from CanCan::AccessDenied do |exception|
    render :text => "Access Forbidden", :status => 403, :layout => false
  end
  
  private
  
  def allow_origin_multiple_origin_domains
    response.headers["Access-Control-Allow-Origin"] = "*"
  end
end