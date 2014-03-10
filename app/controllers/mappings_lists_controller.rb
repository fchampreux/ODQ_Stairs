class MappingsListsController < ApplicationController
# Check for active session  
  before_action :signed_in_user

# Retrieve current list
  before_action :set_mappings_list, only: [:show, :edit, :update, :destroy]

  # GET /mappings_list
  # GET /mappings_list.json
  def index
    @mappings_list = MappingsList.pgnd(current_playground).order("name")
  end

  # GET /mappings_list/1
  # GET /mappings_list/1.json
  def show
    ### Retrieved by Callback function
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
    @mappings_list.updated_by = current_user.login
    @mappings_list.created_by = current_user.login
    @mappings_list.playground_id = current_user.current_playground_id
    @mappings_list.owner_id = current_user.id

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
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

    def set_mappings_list
      @mappings_list = MappingsList.pgnd(current_playground).find(params[:id])
    end


    # Never trust mappings from the scary internet, only allow the white list through.
    def mappings_list_params
      params.require(:mappings_list).permit(:name, :description, :source_list_id, :target_list_id)
    end
end
