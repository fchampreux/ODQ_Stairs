class BusinessProcessesController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business process
  before_action :set_business_process, only: [:show, :edit, :update, :destroy]

# Create the list of statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /business_processes
  # GET /business_processes.json
  def index
    @business_processes = BusinessProcess.pgnd(current_playground).search(params[:criteria]).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_processes }
    end
  end

  # GET /business_processes/1
  # GET /business_processes/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /business_processes/new
  # GET /business_processes/new.json
  def new
    @business_flow = BusinessFlow.find(params[:business_flow_id])
    @business_process = BusinessProcess.new
  end

  # GET /business_processes/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /business_processes
  # POST /business_processes.json
  def create
    @business_flow = BusinessFlow.find(params[:business_flow_id])
    @business_process = @business_flow.business_processes.build(business_process_params)
    @business_process.updated_by = current_user.login
    @business_process.created_by = current_user.login
    @business_process.playground_id = current_user.current_playground_id
    @business_process.owner_id = current_user.id

    respond_to do |format|
      if @business_process.save
        format.html { redirect_to @business_process, notice: 'Business process was successfully created.' }
        format.json { render json: @business_process, status: :created, location: @business_process }
      else
        format.html { render action: "new" }
        format.json { render json: @business_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_processes/1
  # PUT /business_processes/1.json
  def update
    ### Retrieved by Callback function
    @business_process.updated_by = current_user.login

    respond_to do |format|
      if @business_process.update_attributes(business_process_params)
        format.html { redirect_to @business_process, notice: 'Business process was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_processes/1
  # DELETE /business_processes/1.json
  def destroy
    ### Retrieved by Callback function
    @business_process.destroy

    respond_to do |format|
      format.html { redirect_to business_processes_url }
      format.json { head :no_content }
    end
  end


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current business flow
    def set_business_process
      @business_process = BusinessProcess.pgnd(current_playground).includes(:owner, :status).find(params[:id]) 
    end
    
  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

  ### strong parameters
  def business_process_params
    params.require(:business_process).permit(:code, :name, :status_id, :PCF_index, :PCF_reference, :description)
  end

end
