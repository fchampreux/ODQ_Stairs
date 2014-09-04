class OrganisationsController < ApplicationController
# Check for active session 
  before_action :signed_in_user

# Retrieve current business flow
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

# Create the list of statuses to be used in the form
  before_action :set_statuses_list, only: [:new, :edit, :update, :create]

  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.pgnd(current_playground).search(params[:criteria]).order("hierarchy ASC").paginate(page: params[:page], :per_page => paginate_lines)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organisations }
    end
  end

  # GET /organisations/1
  # GET /organisations/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /organisations/new
  # GET /organisations/new.json
  def new
    @parent_org = Organisation.find(params[:organisation_id])
    @organisation = Organisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organisation }
    end
  end

  # GET /organisations/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /organisations
  # POST /organisations.json
  def create
    @parent_org = Organisation.find(params[:organisation_id])
    @organisation = @parent_org.child_orgs.build(organisation_params)
    metadata_setup(@organisation)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Organisation was successfully created.' }
        format.json { render json: @organisation, status: :created, location: @organisation }
      else
        format.html { render action: "new" }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organisations/1
  # PUT /organisations/1.json
  def update
    ### Retrieved by Callback function
    @organisation.updated_by = current_user.login

    respond_to do |format|
      if @organisation.update_attributes(organisation_params)
        format.html { redirect_to @organisation, notice: 'Organisation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    ### Retrieved by Callback function
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to organisations_url }
      format.json { head :no_content }
    end
  end

### private functions
  private

  ### Use callbacks to share common setup or constraints between actions.
    # Retrieve current business flow
    def set_organisation
      @organisation = Organisation.pgnd(current_playground).includes(:owner, :status, :parent_org).find(params[:id]) 
    end
    
  ### before filters

  ### strong parameters
  def organisation_params
    params.require(:organisation).permit(:code, :name, :description, :parent_id, :status_id)
  end

end
