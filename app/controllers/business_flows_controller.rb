class BusinessFlowsController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business flow
  before_action :set_business_flow, only: [:show, :edit, :update, :destroy]

# Create the list of statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /business_flows
  # GET /business_flows.json
  def index
    @business_flows = BusinessFlow.order("hierarchy ASC").paginate(page: params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_flows }
    end
  end

  # GET /business_flows/1
  # GET /business_flows/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /business_flows/new
  # GET /business_flows/new.json
  def new
    @business_area = BusinessArea.find(params[:business_area_id])
    @business_flow = BusinessFlow.new
  end

  # GET /business_flows/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /business_flows
  # POST /business_flows.json
  def create
    @business_area = BusinessArea.find(params[:business_area_id])
    @business_flow = @business_area.business_flows.build(business_flow_params)
    @business_flow.updated_by = current_user.login
    @business_flow.created_by = current_user.login
    @business_flow.playground_id = current_user.current_playground_id
    @business_flow.owner_id = current_user.id

    respond_to do |format|
      if @business_flow.save
        format.html { redirect_to @business_flow, notice: 'Business flow was successfully created.' }
        format.json { render json: @business_flow, status: :created, location: @business_flow }
      else
        format.html { render action: "new" }
        format.json { render json: @business_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_flows/1
  # PUT /business_flows/1.json
  def update
    ### Retrieved by Callback function
    @business_flow.updated_by = current_user.login

    respond_to do |format|
      if @business_flow.update_attributes(business_flow_params)
        format.html { redirect_to @business_flow, notice: 'Business flow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_flows/1
  # DELETE /business_flows/1.json
  def destroy
    ### Retrieved by Callback function
    @business_flow.destroy

    respond_to do |format|
      format.html { redirect_to business_flows_url }
      format.json { head :no_content }
    end
  end


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current business flow
    def set_business_flow
      @business_flow = BusinessFlow.includes(:owner, :status).find(params[:id]) 
    end
    
  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

  ### strong parameters
  def business_flow_params
    params.require(:business_flow).permit(:code, :name, :hierarchy, :status_id, :PCF_index, :PCF_reference, :description)
  end

end
