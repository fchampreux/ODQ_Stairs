class MappingsController < ApplicationController
# Check for active session  
  before_action :signed_in_user

# Retrieve current mapping
# before_action :set_mapping, only: [:show, :edit, :update, :destroy]

# Retrieve current mappings batch
#  before_action :set_mappings_batch, only: [:edit, :update]

# Retrieve target values list
  before_action :set_target_values, only: [:edit, :update]

  # GET /mappings
  # GET /mappings.json
  def index
    @mappings = Mapping.pgnd(current_playground).all
  end

  # GET /mappings/1
  # GET /mappings/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /mappings/new
  def new
    @mappings_list = MappingsList.find(params[:mappings_list_id])
    @mapping = Mapping.new
  end

  # GET /mappings/1/edit
  def edit
    @mappings_list = MappingsList.find(params[:id])
    @mappings_batch = Array(@mappings_list.mappings.order(:source_caption))

  end

  # POST /mappings
  # POST /mappings.json
  def create
    @mappings_list = MappingsList.find(params[:mappings_list_id])
    @mapping = @mappings_list.mappings.build(mapping_params)
    metadata_setup(@mapping)

    respond_to do |format|
      if @mapping.save
        format.html { redirect_to @mapping.mappings_list , notice: 'Mapping was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mapping }
      else
        format.html { render action: 'new' }
        format.json { render json: @mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mappings/1
  # PATCH/PUT /mappings/1.json
  def update
    ### Retrieved by Callback function
    @mapping.updated_by = current_user.login

    respond_to do |format|
      if @mapping.update(mapping_params)
        format.html { redirect_to @mapping.mappings_list , notice: 'Mapping was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mappings/1
  # DELETE /mappings/1.json
  def destroy
      redirect_to @mapping.mappings_list, notice: 'Mapping was deleted.'
      @mapping.destroy

  end

### private functions definitions
  private

  ### Use callbacks to share common setup or constraints between actions.

    # retrieve current mapping for edit or destroy actions
    def set_mapping
      @mapping = Mapping.pgnd(current_playground).find(params[:id])
    end

    # Retrieve target values list
    def set_target_values
      @mappings_list = MappingsList.find(params[:id])
      @target_values = @mappings_list.target_list.values
    end

  ### before filters

    # Never trust mappings from the scary internet, only allow the white list through.
    def mapping_params
      params.require(:mapping).permit(:name, :description, :source_value_id, :target_value_id, :source_code, :target_code, :source_caption, :target_caption)
    end
end
