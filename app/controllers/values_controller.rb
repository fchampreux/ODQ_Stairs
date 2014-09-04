class ValuesController < ApplicationController
# Check for active session  
  before_action :signed_in_user

# Retrieve current value
  before_action :set_value, only: [:show, :edit, :update, :destroy]

  # GET /values
  # GET /values.json
  def index
    @values = Value.pgnd(current_playground).all
  end

  # GET /values/1
  # GET /values/1.json
  def show
    ### Retrieved by Callback function
  end

  # GET /values/new
  def new
    @values_list = ValuesList.find(params[:values_list_id])
    @value = Value.new
  end

  # GET /values/1/edit
  def edit
    ### Retrieved by Callback function
  end

  # POST /values
  # POST /values.json
  def create
    @values_list = ValuesList.find(params[:values_list_id])
    @value = @values_list.values.build(value_params)
    metadata_setup(@value)

    respond_to do |format|
      if @value.save
        format.html { redirect_to @value.values_list , notice: 'Value was successfully created.' }
        format.json { render action: 'show', status: :created, location: @value }
      else
        format.html { render action: 'new' }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /values/1
  # PATCH/PUT /values/1.json
  def update
    ### Retrieved by Callback function
    @value.updated_by = current_user.login

    respond_to do |format|
      if @value.update(value_params)
        format.html { redirect_to @value.values_list , notice: 'Value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1
  # DELETE /values/1.json
  def destroy
      redirect_to @value.values_list, notice: 'Value was deleted.'
      @value.destroy
  end

### private functions definitions
  private

  ### Use callbacks to share common setup or constraints between actions.

    # retrieve current value for edit or destroy actions
    def set_value
      @value = Value.pgnd(current_playground).find(params[:id])
    end

  ### before filters

    # Never trust values from the scary internet, only allow the white list through.
    def value_params
      params.require(:value).permit(:name, :description, :value_code, :value_caption)
    end
end
