class BusinessObjectsController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business process
  before_action :set_business_object, only: [:show, :edit, :update, :destroy]

# Create the list of statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /business_objects
  # GET /business_objects.json
  def index
    @business_objects = BusinessObject.pgnd(current_playground).search(params[:criteria]).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_objects }
    end
  end

  # GET /business_objects/1
  # GET /business_objects/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /business_objects/new
  # GET /business_objects/new.json
  def new
    @business_area = BusinessArea.find(params[:business_area_id])
    @business_object = BusinessObject.new
  end

  # GET /business_objects/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /business_objects
  # POST /business_objects.json
  def create
    @business_area = BusinessArea.find(params[:business_area_id])
    @business_object = @business_area.business_objects.build(business_object_params)
    metadata_setup(@business_object)

    respond_to do |format|
      if @business_object.save
        format.html { redirect_to @business_object, notice: 'Business object was successfully created.' }
        format.json { render json: @business_object, status: :created, location: @business_object }
      else
        format.html { render action: "new" }
        format.json { render json: @business_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_objects/1
  # PUT /business_objects/1.json
  def update
    ### Retrieved by Callback function
    @business_object.updated_by = current_user.login
    @columns = @business_object.columns.all

    respond_to do |format|
      if @business_object.update(business_object_params)
        format.html { redirect_to @business_object, notice: 'Business object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_objects/1
  # DELETE /business_objects/1.json
  def destroy
    ### Retrieved by Callback function
    @business_object.destroy

    respond_to do |format|
      format.html { redirect_to business_objects_url }
      format.json { head :no_content }
    end
  end

### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current business flow
    def set_business_object
      @business_object = BusinessObject.pgnd(current_playground).includes(:owner, :status).find(params[:id]) 
    end
    
  ### before filters

  ### strong parameters
  def business_object_params
    params.require(:business_object).permit(:code, :name, :status_id, :pcf_index, :pcf_reference, :description, :organisation_level, :territory_level, columns_attributes: [:is_key, :is_published, :id])
  end

end
