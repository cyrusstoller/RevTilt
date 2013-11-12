class ReviewsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /reviews
  # GET /reviews.json
  def index
    authorize! :index, Review
    
    @reviews = Review.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

    authorize! :show, @review

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new(:organization_id => params[:o_id])
    @review.user = current_user
    
    authorize! :new, @review

    @title = new_action_title

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
    
    authorize! :edit, @review
    
    @title = edit_action_title
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(permitted_params)
    @review.user = current_user
    
    authorize! :create, @review
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.organization || root_path, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { @title = new_action_title; render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    authorize! :update, @review

    respond_to do |format|
      if @review.update_attributes(permitted_params)
        format.html { redirect_to @review.organization || @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { @title = edit_action_title; render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    
    authorize! :destroy, @review
    
    @review.destroy

    respond_to do |format|
      format.html { redirect_to @review.organization || root_path }
      format.json { head :no_content }
    end
  end
  
  protected
  
  def permitted_params
    params.require(:review).permit(:condition_id, :content, :organization_id, :rating)
  end
  
  def new_action_title
    "New Review"
  end
  
  def edit_action_title
    "Edit Review"
  end
end
