class Relationships::OrganizationUsersController < ApplicationController
  before_filter :authenticate_user!

  # GET /relationships/organization_users
  # GET /relationships/organization_users.json
  def index
    @relationships_organization_users = Relationships::OrganizationUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relationships_organization_users }
    end
  end

  # GET /relationships/organization_users/1
  # GET /relationships/organization_users/1.json
  def show
    @relationships_organization_user = Relationships::OrganizationUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relationships_organization_user }
    end
  end

  # GET /relationships/organization_users/new
  # GET /relationships/organization_users/new.json
  def new
    @relationships_organization_user = Relationships::OrganizationUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relationships_organization_user }
    end
  end

  # GET /relationships/organization_users/1/edit
  def edit
    @relationships_organization_user = Relationships::OrganizationUser.find(params[:id])
  end

  # POST /relationships/organization_users
  # POST /relationships/organization_users.json
  def create
    @relationships_organization_user = Relationships::OrganizationUser.new(params[:relationships_organization_user])

    respond_to do |format|
      if @relationships_organization_user.save
        format.html { redirect_to @relationships_organization_user, notice: 'Organization user was successfully created.' }
        format.json { render json: @relationships_organization_user, status: :created, location: @relationships_organization_user }
      else
        format.html { render action: "new" }
        format.json { render json: @relationships_organization_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /relationships/organization_users/1
  # PUT /relationships/organization_users/1.json
  def update
    @relationships_organization_user = Relationships::OrganizationUser.find(params[:id])

    respond_to do |format|
      if @relationships_organization_user.update_attributes(params[:relationships_organization_user])
        format.html { redirect_to @relationships_organization_user, notice: 'Organization user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @relationships_organization_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/organization_users/1
  # DELETE /relationships/organization_users/1.json
  def destroy
    @relationships_organization_user = Relationships::OrganizationUser.find(params[:id])
    @relationships_organization_user.destroy

    respond_to do |format|
      format.html { redirect_to relationships_organization_users_url }
      format.json { head :no_content }
    end
  end
  
  # POST /relationships/organization_users/favorite
  # POST /relationships/organization_users/favorite.js
  # POST /relationships/organization_users/favorite.json
  def favorite
    @organization = Organization.find(params[:organization_id])
    @relationships_organization_user = current_user.favorite!(@organization)
    
    respond_to do |format|
      format.html { redirect_to @organization }
      format.json { render json: @relationships_organization_user, status: :created }
      format.js
    end
  end
  
  # DELETE /relationships/organization_users/unfavorite
  # DELETE /relationships/organization_users/unfavorite.js
  # DELETE /relationships/organization_users/unfavorite.json
  def unfavorite
    @organization = Organization.find(params[:organization_id])
    @relationships_organization_user = current_user.unfavorite!(@organization)
    
    respond_to do |format|
      format.html { redirect_to @organization }
      format.json { render json: @relationships_organization_user, status: :created }
      format.js
    end
  end
end
