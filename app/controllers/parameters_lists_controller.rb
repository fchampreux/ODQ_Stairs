class ParametersListsController < ApplicationController
# Check for active session  
  before_action :authenticate_user!

# Retrieve current list
  before_action :set_parameters_list, only: [:show, :edit, :update, :destroy]

  # GET /parameters_list
  # GET /parameters_list.json
  def index
    @parameters_lists = ParametersList.order("name")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parameters_lists }
      format.csv { send_data @parameters_lists.to_csv }
      format.xls # uses specific template to render xml
    end
  end

  # GET /parameters_list/1
  # GET /parameters_list/1.json
  def show
    ### Retrieved by Callback function
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parameters_list.parameters }
      format.csv { send_data @parameters_list.parameters.to_csv }
      format.xls # uses specific template to render xml
    end
  end

  # GET /parameters_list/new
  def new
    @parameters_list = ParametersList.new
  end

  # GET /parameters_list/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /parameters_list
  # POST /parameters_list.json
  def create
    @parameters_list = ParametersList.new(parameters_list_params)
    metadata_setup(@parameters_list)

    respond_to do |format|
      if @parameters_list.save
        format.html { redirect_to @parameters_list, notice: 'List of parameters was successfully created.' }
        format.json { render action: 'show', status: :created, location: @parameters_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @parameters_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parameters_list/1
  # PATCH/PUT /parameters_list/1.json
  def update
    ### Retrieved by Callback function
    @parameters_list.updated_by = current_user.login
    respond_to do |format|
      if @parameters_list.update(parameters_list_params)
        format.html { redirect_to @parameters_list, notice: 'List of parameters was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parameters_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parameters_list/1
  # DELETE /parameters_list/1.json
  def destroy
    ### Retrieved by Callback function
    @parameters_list.destroy
    respond_to do |format|
      format.html { redirect_to parameters_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_parameters_list
      @parameters_list = ParametersList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parameters_list_params
      params.require(:parameters_list).permit(:name, :description, :is_user_specific, parameters_attributes: [:name, :description, :param_code, :param_value, :active_from, :active_to, :_destroy, :id] )
    end
end
