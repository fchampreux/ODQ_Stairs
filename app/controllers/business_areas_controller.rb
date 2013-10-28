class BusinessAreasController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Create the list statuses to be used in the form
  before_action :set_statuses_lists, only: [:new, :edit, :update, :create]

  # GET /business_areas
  # GET /business_areas.json
  def index
    @business_areas = BusinessArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_areas }
    end
  end

  # GET /business_areas/1
  # GET /business_areas/1.json
  def show
    @business_area = BusinessArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_area }
    end
  end

  # GET /business_areas/new
  # GET /business_areas/new.json
  def new
    @business_area = BusinessArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_area }
    end
  end

  # GET /business_areas/1/edit
  def edit
    @business_area = BusinessArea.find(params[:id])
  end

  # POST /business_areas
  # POST /business_areas.json
  def create
    @business_area = BusinessArea.new(business_area_params)

    respond_to do |format|
      if @business_area.save
        format.html { redirect_to @business_area, notice: 'Business area was successfully created.' }
        format.json { render json: @business_area, status: :created, location: @business_area }
      else
        format.html { render action: "new" }
        format.json { render json: @business_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_areas/1
  # PUT /business_areas/1.json
  def update
    @business_area = BusinessArea.find(params[:id])

    respond_to do |format|
      if @business_area.update_attributes(business_area_params)
        format.html { redirect_to @business_area, notice: 'Business area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_areas/1
  # DELETE /business_areas/1.json
  def destroy
    @business_area = BusinessArea.find(params[:id])
    @business_area.destroy

    respond_to do |format|
      format.html { redirect_to business_areas_url }
      format.json { head :no_content }
    end
  end

### private functions
  private

    # retrieve current user 
    def current_user
      remember_token = User.encrypt(cookies[:remember_token])
      @current_user ||= User.find_by(remember_token: remember_token)
    end

    # retrieve the list of statuses
    def set_statuses_list
      @statuses = Parameter.where("parameters_list=LIST_OF_STATUSES")
    end 

  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

  ### strong parameters
  def business_area_params
    params.require(:business_area).permit(:code, :name, :hierarchy, :created_by, :updated_by, :owner_id, :status_id, :playground_id, :PCF_index, :PCF_reference, :description)
  end

end
