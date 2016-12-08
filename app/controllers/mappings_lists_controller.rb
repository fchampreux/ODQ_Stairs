class MappingsListsController < ApplicationController
# Check for active session  
  before_action :signed_in_user

# Retrieve current current mapping
  before_action :set_mappings_list, only: [:show, :edit, :update, :destroy]
  
# Retrieve all lists of values
  before_action :set_values_lists

# Retrieve target values list
  before_action :set_target_values, only: [:edit, :update]

  # GET /mappings_list
  # GET /mappings_list.json
  def index
    @mappings_lists = MappingsList.pgnd(current_playground).order("name")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mappings_lists }
      format.csv { send_data @mappings_lists.to_csv }
      format.xls # uses specific template to render xml
    end
  end

  # GET /mappings_list/1
  # GET /mappings_list/1.json
  def show
    ### Retrieved by Callback function
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mappings_list.mappings }
      format.csv { send_data @mappings_list.mappings.to_csv }
      format.xls # uses specific template to render xml
    end
  end

  # GET /mappings_list/new
  def new
    @mappings_list = MappingsList.new
  end

  # GET /mappings_list/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /mappings_list
  # POST /mappings_list.json
  def create
    @mappings_list = MappingsList.new(mappings_list_params)
    metadata_setup(@mappings_list)

    respond_to do |format|
      if @mappings_list.save
        format.html { redirect_to @mappings_list, notice: 'List of mappings was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mappings_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @mappings_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mappings_list/1
  # PATCH/PUT /mappings_list/1.json
  def update
    ### Retrieved by Callback function
    @mappings_list.updated_by = current_user.login
    @mappings  = @mappings_list.mappings.all
    respond_to do |format|
      if @mappings_list.update(mappings_list_params)
        format.html { redirect_to @mappings_list, notice: 'List of mappings was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mappings_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mappings_list/1
  # DELETE /mappings_list/1.json
  def destroy
    ### Retrieved by Callback function
    @mappings_list.destroy
    respond_to do |format|
      format.html { redirect_to mappings_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_mappings_list
      @mappings_list = MappingsList.pgnd(current_playground).find(params[:id])
    end

    # retrieve the list of values lists
    def set_values_lists
      @lists_of_values = ValuesList.all
    end 

    # Retrieve target values list
    def set_target_values
      @mappings_list = MappingsList.find(params[:id])
      @target_values = @mappings_list.target_list.values
    end

    # Never trust mappings from the scary internet, only allow the white list through.
    def mappings_list_params
      params.require(:mappings_list).permit(:name, :description, :source_list_id, :target_list_id, mappings_attributes: [:target_code, :target_caption, :id])
    end
end
