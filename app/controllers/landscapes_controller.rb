class LandscapesController < ApplicationController
  # Check for active session 
  before_action :signed_in_user

# Retrieve current landscape
  before_action :set_landscape, only: [:show, :edit, :update, :destroy]

# Create the list statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /landscapes
  # GET /landscapes.json
  def index
    @landscapes = Landscape.order("hierarchy ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @landscapes }
    end
  end

  # GET /landscapes/1
  # GET /landscapes/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /landscapes/new
  # GET /landscapes/new.json
  def new
    @landscape = Landscape.new
  end

  # GET /landscapes/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /landscapes
  # POST /landscapes.json
  def create
    @playground = Playground.find(params[:playground_id])
    @landscape = @playground.landscapes.build(landscape_params)
    @landscape.updated_by = current_user.login
    @landscape.created_by = current_user.login
    @landscape.playground_id = current_user.current_playground_id
    @landscape.owner_id = current_user.id
    
    respond_to do |format|
      if @landscape.save
        format.html { redirect_to @landscape, notice: 'Landscape was successfully created.' }
        format.json { render json: @landscape, status: :created, location: @landscape }
      else
        format.html { render action: "new" }
        format.json { render json: @landscape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /landscapes/1
  # PUT /landscapes/1.json
  def update
    ### Retrieved by Callback function
    @landscape.updated_by = current_user.login    

    respond_to do |format|
      if @landscape.update_attributes(params[:landscape])
        format.html { redirect_to @landscape, notice: 'Landscape was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @landscape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landscapes/1
  # DELETE /landscapes/1.json
  def destroy
    ### Retrieved by Callback function
    @landscape.destroy

    respond_to do |format|
      format.html { redirect_to landscapes_url }
      format.json { head :no_content }
    end
  end
  


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current landscape
    def set_landscape
      @landscape= Landscape.includes(:owner, :status).find(params[:id]) 
    end
    
  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

  ### strong parameters
  def landscape_params
    params.require(:landscape).permit(:code, :name, :hierarchy, :status_id, :description)
  end  
  
end
