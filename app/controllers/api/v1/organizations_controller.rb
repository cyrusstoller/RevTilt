class Api::V1::OrganizationsController < Api::V1::ApplicationController
  def index
    @organizations = Organization.paginate(:page => params[:page])
  end
  
  def show
    @organization = Organization.find(params[:id])
    @reviews = @organization.reviews.with_condition(0).paginate(:page => params[:page])
  end
end
