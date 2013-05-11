class OrganizationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /organizations
  # GET /organizations.json
  def index
    authorize! :index, Organization
    
    @organizations = Organization.paginate(:page => params[:page])
    @organizations = @organizations.where(:category_id => params[:category]) unless params[:category].blank?
    @organizations = @organizations.joins(%(LEFT JOIN "cache_review_stats" ON "cache_review_stats"."organization_id" = "organizations"."id")).
                        where(%("cache_review_stats"."condition_id" = 0 OR "cache_review_stats"."condition_id" IS NULL)).
                        select(%("organizations".*, "cache_review_stats"."num_reviews", "cache_review_stats"."avg_review")).
                        order(%("cache_review_stats"."avg_review" DESC NULLS LAST)).
                        order(%("cache_review_stats"."num_reviews" DESC))
    @organizations = @organizations.near(params[:zipcode], 25) unless params[:zipcode].blank?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
    
    authorize! :show, @organization
    
    @reviews = @organization.reviews.paginate(:page => params[:page])

    @review = Review.new
    @review.organization = @organization
    @review.condition_id = 0
    
    @title = @organization.name
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.json
  def new
    @organization = Organization.new
    @organization.name = params[:name]
    @organization.url = params[:url]
    @organization.homepage_url = params[:homepage_url]
    @organization.address = params[:address]

    authorize! :new, @organization

    @title = new_action_title

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])

    authorize! :edit, @organization
    
    @title = edit_action_title
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(params[:organization])

    authorize! :create, @organization

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.html {
          existing_organization = Organization.with_url(@organization.url)
          if existing_organization.nil?
            @title = new_action_title; render action: "new"
          else
            redirect_to existing_organization, :notice => "Organization has already been submitted."
          end
        }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.json
  def update
    @organization = Organization.find(params[:id])

    authorize! :update, @organization

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { @title = edit_action_title; render action: "edit" }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])

    authorize! :destroy, @organization

    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end
  
  protected
  
  def new_action_title
    "Share an Organization"
  end
  
  def edit_action_title
    "Edit Organization"
  end
end
