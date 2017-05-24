class PlaygroundsController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!

# Retrieve current playground
  before_action :set_playground, only: [:show, :edit, :update, :destroy]

# Create the list statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]
  # GET /playgrounds
  # GET /playgrounds.json
  def index
    @playgrounds = Playground.search(params[:criteria]).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playgrounds }
    end
  end

  # GET /playgrounds/1
  # GET /playgrounds/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /playgrounds/new
  # GET /playgrounds/new.json
  def new
    @playground = Playground.new
  end

  # GET /playgrounds/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /playgrounds
  # POST /playgrounds.json
  def create
    @playground = Playground.new(playground_params)
    metadata_setup(@playground)

    respond_to do |format|
      if @playground.save
        format.html { redirect_to @playground, notice: 'Playground was successfully created.' }
        format.json { render json: @playground, status: :created, location: @playground }
      else
        format.html { render action: "new" }
        format.json { render json: @playground.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playgrounds/1
  # PUT /playgrounds/1.json
  def update
    ### Retrieved by Callback function
    @playground.updated_by = current_user.user_name    

    respond_to do |format|
      if @playground.update_attributes(playground_params)
        format.html { redirect_to @playground, notice: 'Playground was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playground.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playgrounds/1
  # DELETE /playgrounds/1.json
  def destroy
    ### Retrieved by Callback function
    @playground.destroy

    respond_to do |format|
      format.html { redirect_to playgrounds_url }
      format.json { head :no_content }
    end
  end
  


### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current playground
    def set_playground
      @playground = Playground.includes(:owner, :status).find(params[:id]) 
    end
    
  ### before filters

  ### strong parameters
  def playground_params
    params.require(:playground).permit(:code, :name, :status_id, :description)
  end

  
end
