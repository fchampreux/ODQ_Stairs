class ValuesListsController < ApplicationController
# Check for active session  
  before_action :signed_in_user

# Retrieve current list
  before_action :set_values_list, only: [:show, :edit, :update, :destroy]

# Retrieve the list of managed softwares
  before_action :set_softwares_list

  # GET /values_list
  # GET /values_list.json
  def index
    @values_list = ValuesList.pgnd(current_playground).order("name")
  end

  # GET /values_list/1
  # GET /values_list/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /values_list/new
  def new
    @values_list = ValuesList.new
  end

  # GET /values_list/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /values_list
  # POST /values_list.json
  def create
    @values_list = ValuesList.new(values_list_params)
    @values_list.updated_by = current_user.login
    @values_list.created_by = current_user.login
    @values_list.playground_id = current_user.current_playground_id
    @values_list.owner_id = current_user.id

    respond_to do |format|
      if @values_list.save
        format.html { redirect_to @values_list, notice: 'List of values was successfully created.' }
        format.json { render action: 'show', status: :created, location: @values_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @values_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /values_list/1
  # PATCH/PUT /values_list/1.json
  def update
    ### Retrieved by Callback function
    @values_list.updated_by = current_user.login
    respond_to do |format|
      if @values_list.update(values_list_params)
        format.html { redirect_to @values_list, notice: 'List of values was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @values_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values_list/1
  # DELETE /values_list/1.json
  def destroy
    ### Retrieved by Callback function
    @values_list.destroy
    respond_to do |format|
      format.html { redirect_to values_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

    def set_values_list
      @values_list = ValuesList.pgnd(current_playground).find(params[:id])
    end

    # Never trust values from the scary internet, only allow the white list through.
    def values_list_params
      params.require(:values_list).permit(:name, :description, :software_id, :software_name, :table_name)
    end
end
