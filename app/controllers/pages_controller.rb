class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => [:favorites]
  
  def about
    @title = "About"
  end
  
  def bookmarklet
    @title = "Bookmarklet"
    
    respond_to do |format|
      format.html
      format.js {
        service_string = params[:service].downcase rescue nil
        @new_window = params[:new_window] || false
        case service_string
        when "yelp"
          render "pages/bookmarklets/yelp_bookmarklet"
        else
          render "pages/bookmarklets/error_bookmarklet", :status => 404
        end
      }
    end
  end
  
  def favorites
    @organizations = current_user.favorite_organizations.paginate(:page => params[:page])
    if @organizations.count == 0
      redirect_to root_path, :notice => "You haven't selected any favorites yet"
    end
  end
  
  def press
    @title = "Press"
  end
end
