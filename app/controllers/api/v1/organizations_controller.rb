class Api::V1::OrganizationsController < Api::V1::ApplicationController
  def index
    @organizations = Organization.paginate(:page => params[:page])
    
    @organizations = @organizations.joins(%(LEFT JOIN "cache_review_stats" ON "cache_review_stats"."organization_id" = "organizations"."id")).
                        where(%("cache_review_stats"."condition_id" = 0 OR "cache_review_stats"."condition_id" IS NULL)).
                        order(%("cache_review_stats"."avg_review" DESC NULLS LAST)).
                        order(%("cache_review_stats"."num_reviews" DESC))
    
    if params[:latitude].present? and params[:longitude].present? and params[:radius]
      @organizations = @organizations.near([params[:latitude], params[:longitude]], params[:radius])
    end
  end
  
  def show
    @organization = Organization.find(params[:id])
    @reviews = @organization.reviews.with_condition(0).paginate(:page => params[:page])
  end
end
