class BusinessAreasController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business area
  before_action :set_business_area, only: [:show, :edit, :update, :destroy]

# Create the list statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /business_areas
  # GET /business_areas.json
  def index
    @business_areas = BusinessArea.pgnd(current_playground).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_areas }
    end
  end

  # GET /business_areas/1
  # GET /business_areas/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /business_areas/new
  # GET /business_areas/new.json
  def new
    @business_area = BusinessArea.new
  end

  # GET /business_areas/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /business_areas
  # POST /business_areas.json
  def create
    @business_area = BusinessArea.new(business_area_params)
    @business_area.updated_by = current_user.login
    @business_area.created_by = current_user.login
    @business_area.playground_id = current_playground
    @business_area.owner_id = current_user.id

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
    ### Retrieved by Callback function
    @business_area.updated_by = current_user.login

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
    ### Retrieved by Callback function
    @business_area.destroy

    respond_to do |format|
      format.html { redirect_to business_areas_url }
      format.json { head :no_content }
    end
  end


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current business area
    def set_business_area
      @business_area = BusinessArea.pgnd(current_playground).includes(:owner, :status).find(params[:id]) 
    end
    
  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

  ### strong parameters
  def business_area_params
    params.require(:business_area).permit(:code, :name, :status_id, :PCF_index, :PCF_reference, :description)
  end

end
