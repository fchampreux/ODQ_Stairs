class ParametersListsController < ApplicationController
# Check for active session  
  before_action :signed_in_user

# Retrieve current list
  before_action :set_parameters_list, only: [:show, :edit, :update, :destroy]

  # GET /parameters_list
  # GET /parameters_list.json
  def index
    @parameters_list = ParametersList.pgnd(current_playground).order("name")
  end

  # GET /parameters_list/1
  # GET /parameters_list/1.json
  def show
    ### Retrieved by Callback function
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
    @parameters_list.updated_by = current_user.login
    @parameters_list.created_by = current_user.login
    @parameters_list.playground_id = current_user.current_playground_id
    @parameters_list.owner_id = current_user.id

    respond_to do |format|
      if @parameters_list.save
        format.html { redirect_to @parameters_list, notice: 'Lists of parameter was successfully created.' }
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
        format.html { redirect_to @parameters_list, notice: 'Lists of parameter was successfully updated.' }
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
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

    def set_parameters_list
      @parameters_list = ParametersList.pgnd(current_playground).find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def parameters_list_params
      params.require(:parameters_list).permit(:name, :description, :is_user_specific)
    end
end
