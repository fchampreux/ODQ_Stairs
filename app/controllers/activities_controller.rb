class ActivitiesController < ApplicationController
# Check for active session 
  before_action :authenticate_user!

# Retrieve current business rule
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

# Create the selection lists be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.pgnd(current_playground).search(params[:criteria]).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
      format.csv { send_data @activities.to_csv }
      format.xls # uses specific template to render xml
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @business_process = BusinessProcess.find(params[:business_process_id])
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /activities
  # POST /activities.json
  def create
    @business_process = BusinessProcess.find(params[:business_process_id])
    @activity = @business_process.activities.build(activity_params)
    metadata_setup(@activity)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    ### Retrieved by Callback function
    @activity.updated_by = current_user.user_name

    respond_to do |format|
      if @activity.update_attributes(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    ### Retrieved by Callback function
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current activity
    def set_activity_rule
      @activity = Activity.pgnd(current_playground).includes(:owner, :status).find(params[:id]) 
    end

  ### before filters

    
  ### strong parameters
  def activity_params
    params.require(:activity).permit(:id, :code, :name, :status_id, :description, :version, :approver_id, :approved_at)
  end


end
