class BusinessRulesController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business rule
  before_action :set_business_rule, only: [:show, :edit, :update, :destroy]

# Create the selection lists be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]
  before_action :set_rule_types_list, only: [:new, :edit, :update, :create]
  before_action :set_business_objects_list, only: [:new, :edit]
  before_action :set_severity_list, only: [:new, :edit, :update, :create]
  before_action :set_complexity_list, only: [:new, :edit, :update, :create]

  # GET /business_rules
  # GET /business_rules.json
  def index
    @business_rules = BusinessRule.pgnd(current_playground).search(params[:criteria]).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_rules }
    end
  end

  # GET /business_rules/1
  # GET /business_rules/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /business_rules/new
  # GET /business_rules/new.json
  def new
    @business_process = BusinessProcess.find(params[:business_process_id])
    @business_rule = BusinessRule.new
  end

  # GET /business_rules/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /business_rules
  # POST /business_rules.json
  def create
    @business_process = BusinessProcess.find(params[:business_process_id])
    @business_rule = @business_process.business_rules.build(business_rule_params)
    metadata_setup(@business_rule)

    respond_to do |format|
      if @business_rule.save
        format.html { redirect_to @business_rule, notice: 'Business rule was successfully created.' }
        format.json { render json: @business_rule, status: :created, location: @business_rule }
      else
        format.html { render action: "new" }
        format.json { render json: @business_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_rules/1
  # PUT /business_rules/1.json
  def update
    ### Retrieved by Callback function
    @business_rule.updated_by = current_user.login

    respond_to do |format|
      if @business_rule.update_attributes(business_rule_params)
        format.html { redirect_to @business_rule, notice: 'Business rule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_rules/1
  # DELETE /business_rules/1.json
  def destroy
    ### Retrieved by Callback function
    @business_rule.destroy

    respond_to do |format|
      format.html { redirect_to business_rules_url }
      format.json { head :no_content }
    end
  end


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current business rule
    def set_business_rule
      @business_rule = BusinessRule.pgnd(current_playground).includes(:owner, :status).find(params[:id]) 
    end

    # Retrieve business objects list
    def set_business_objects_list
      if action_name == 'edit'
        my_business_area = @business_rule.business_process.business_flow.business_area_id
      else
        my_business_area = BusinessProcess.find(params[:business_process_id]).business_flow.business_area_id
      end
      @business_objects_list = BusinessObject.where("business_area_id = ?", my_business_area)
    end

  ### before filters

    
  ### strong parameters
  def business_rule_params
    params.require(:business_rule).permit(:code, :name, :status_id, :description, :business_value, :check_description, :check_script, :correction_method, :correction_script, 
				:correction_batch, :white_list, :rule_type_id, :condition, :complexity_id, :added_value, :severity_id, :maintenance_cost, :maintenance_duration, 
				:version, :approver_id, :approved_at, :business_object_id)
  end


end
