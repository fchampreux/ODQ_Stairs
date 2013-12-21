class ParametersController < ApplicationController
# Check for active session  
  before_action :signed_in_user

# Retrieve current parameter
  before_action :set_parameter, only: [:show, :edit, :update, :destroy]

# Create the list of parameters lists to be used in the form
  before_action :set_parameters_lists, only: [:new, :edit, :update, :create]


  # GET /parameters
  # GET /parameters.json
  def index
    @parameters = Parameter.order("is_list DESC, parent_list ASC")
  end

  # GET /parameters/1
  # GET /parameters/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /parameters/new
  def new
    @parameter = Parameter.new
  end

  # GET /parameters/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /parameters
  # POST /parameters.json
  def create
    @parameter = Parameter.new(parameter_params)
    @parameter.updated_by = current_user.login
    @parameter.created_by = current_user.login
    @parameter.playground_id = current_user.current_playground_id

    respond_to do |format|
      if @parameter.save
        format.html { redirect_to parameters_url , notice: 'Parameter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @parameter }
      else
        format.html { render action: 'new' }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parameters/1
  # PATCH/PUT /parameters/1.json
  def update
    ### Retrieved by Callback function
    @parameter.updated_by = current_user.login

    respond_to do |format|
      if @parameter.update(parameter_params)
        format.html { redirect_to parameters_url , notice: 'Parameter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parameters/1
  # DELETE /parameters/1.json
  def destroy
      @parameter.active_to = DateTime.now
      @parameter.save
      redirect_to parameters_path
  end

### private functions definitions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # build the list of parameters lists
    def set_parameters_lists
      @parameters_lists = Parameter.where(is_list: true)
    end

    # retrieve current parameter for edit or destroy actions
    def set_parameter
      @parameter = Parameter.find(params[:id])
    end

  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parameter_params
      params.require(:parameter).permit( :is_list, :parent_list, :name, :description, :active_from, :active_to)
    end
end