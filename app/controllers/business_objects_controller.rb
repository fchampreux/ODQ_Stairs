class BusinessObjectsController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business process
  before_action :set_business_object, only: [:show, :edit, :update, :destroy, :push]

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
  
  # Push to QFire
  def push
    #ToDo : before action : check user is admin
    
    #Send request to API
    response = HTTParty.post( "http://qfire003.qfiresoftware.com/QFireDQSAPI/API/Collect/AddDataset/3f70923c-d87b-4d11-935a-a5c4008dee3b/json",
    :headers => {"Content-type" => "application/json"},
    :body => { :"datasetName" => @business_object.name, :"datasetLabel" => @business_object.name, :"shortDescription" => "Created by Data Quality Stairs", :"longDescription" => @business_object.description }.to_json
    )
    
    #Display feedback to console
    puts response.body, response.message
    
    #Parse feddback
    http_message=JSON.parse(response.body)
    puts http_message                             #Display to console
    datasetId=http_message["datasetId"]           #Assigne dataset id returned
    datasetMessage=http_message["statusMessage"]  #Assign message in return for further testing
    puts datasetId, datasetMessage                #Display values to console
    
    #Create columns
    @business_object.columns.each do |column|
      puts column.name, column.column_type, column.size, column.precision
      #Send request to API
      response = HTTParty.post( "http://qfire003.qfiresoftware.com/QFireDQSAPI/API/Collect/AddDatasetColumn/3f70923c-d87b-4d11-935a-a5c4008dee3b/json",
      :headers => {"Content-type" => "application/json"},
      :body => { :"columnName" => column.name, :"columnLabel" => column.name, :"shortDescription" => "Created by Data Quality Stairs", :"longDescription" => column.description,
      :"dataSetId" => datasetId, :"dataSetColumnType" => column.column_type, :"isPrimarykey" => column.is_key, :"columnLength" => column.size,:"severity" => "Low"  }.to_json
      )
      
      #Display feedback to console
      puts response.body, response.message, datasetId
    end
    
    
    respond_to do |format|
      if true
        format.html { redirect_to @business_object, notice: datasetMessage }
        format.json { head :no_content }
      else
        format.html { render action: "show" }
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
    params.require(:business_object).permit(:code, :name, :status_id, :pcf_index, :pcf_reference, :description, :organisation_level, :territory_level,
      columns_attributes:[:is_key, :is_published, :column_type, :name, :description, :precision, :size, :id])
  end

end
