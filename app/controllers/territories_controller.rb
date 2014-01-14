class TerritoriesController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business flow
  before_action :set_territory, only: [:show, :edit, :update, :destroy]

# Create the list of statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /Territories
  # GET /Territories.json
  def index
    @territories = Territory.order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Territories }
    end
  end

  # GET /Territories/1
  # GET /Territories/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /Territories/new
  # GET /Territories/new.json
  def new
 #   @parent_org = Territory.find(params[:Territory_id])
    @territory = Territory.new(:parent_id => params[:Territory_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @territory }
    end
  end

  # GET /Territories/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /Territories
  # POST /Territories.json
  def create
#    @parent_org = Territory.find(params[:Territory_id])
#    @territory = @parent_org.Territories.build(Territory_params)
    @territory = Territory.new(territory_params)
    @territory.updated_by = current_user.login
    @territory.created_by = current_user.login
    @territory.playground_id = current_user.current_playground_id
    @territory.owner_id = current_user.id

    respond_to do |format|
      if @territory.save
        format.html { redirect_to @territory, notice: 'Territory was successfully created.' }
        format.json { render json: @territory, status: :created, location: @territory }
      else
        format.html { render action: "new" }
        format.json { render json: @territory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Territories/1
  # PUT /Territories/1.json
  def update
    ### Retrieved by Callback function
    @territory.updated_by = current_user.login

    respond_to do |format|
      if @territory.update_attributes(params[:Territory])
        format.html { redirect_to @territory, notice: 'Territory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @territory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Territories/1
  # DELETE /Territories/1.json
  def destroy
    @territory = Territory.find(params[:id])
    @territory.destroy

    respond_to do |format|
      format.html { redirect_to territories_url }
      format.json { head :no_content }
    end
  end

### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current business flow
    def set_territory
      @territory = Territory.includes(:owner, :status, :parent_territory).find(params[:id]) 
    end
    
  ### before filters
    # Check for active session
    def signed_in_user
      redirect_to signin_url, notice: "You must log in to access this page." unless signed_in?
    end

  ### strong parameters
  def territory_params
    params.require(:territory).permit(:code, :name, :description, :parent_id, :status_id)
  end

end
