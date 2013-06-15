class Api::V1::OrganizationsController < Api::V1::ApplicationController
  after_filter :track_google_analytics

  def index
    @organizations = Organization.paginate(:page => params[:page])

    unless params[:category].blank? or params[:category].downcase == "all"
      @organizations = @organizations.where(:category_id => params[:category])
    end

    @organizations = @organizations.joins(%(LEFT JOIN "cache_review_stats" ON "cache_review_stats"."organization_id" = "organizations"."id")).
                        select(%("organizations".*, "cache_review_stats"."num_reviews", "cache_review_stats"."avg_review")).
                        where(%("cache_review_stats"."condition_id" = 0 OR "cache_review_stats"."condition_id" IS NULL)).
                        order(%("cache_review_stats"."avg_review" DESC NULLS LAST)).
                        order(%("cache_review_stats"."num_reviews" DESC))
    
    if params[:latitude].present? and params[:longitude].present? and params[:radius].present?
      @organizations = @organizations.near([params[:latitude], params[:longitude]], params[:radius])
    elsif params[:latitude].present? or params[:longitude].present? or params[:radius].present?
      render :status => 500, :text => "Invalid API Call - must provide latitude, longitude, and radius"
    end
  end
  
  def show
    @organization = Organization.find(params[:id])
    @reviews = @organization.reviews.with_condition(0).paginate(:page => params[:page]).includes(:user)
  end
  
  private
  
  def track_google_analytics
    unless Rails.env.test?
      gabba = Gabba::Gabba.new(APP_CONFIG["google_analytics"][Rails.env], "revtilt.com")
      gabba.page_view("api call", request.fullpath)
    end
  end
end
