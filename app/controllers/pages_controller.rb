class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => [:favorites]
  
  def about
    @title = "About"
  end
  
  def favorites
    @organizations = current_user.favorite_organizations.paginate(:page => params[:page])
    if @organizations.count == 0
      redirect_to root_path, :notice => "You haven't selected any favorites yet"
    end
  end
end
