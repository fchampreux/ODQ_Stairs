class DataProcessesController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  before_action :set_data_process, only: [:show, :edit, :update, :destroy]

  # GET /data_processes
  # GET /data_processes.json
  def index
    @data_processes = DataProcess.all
  end

  # GET /data_processes/1
  # GET /data_processes/1.json
  def show
  end

  # GET /data_processes/new
  def new
    @data_process = DataProcess.new
  end

  # GET /data_processes/1/edit
  def edit
  end

  # POST /data_processes
  # POST /data_processes.json
  def create
    @data_process = DataProcess.new(data_process_params)

    respond_to do |format|
      if @data_process.save
        format.html { redirect_to @data_process, notice: 'Data process was successfully created.' }
        format.json { render action: 'show', status: :created, location: @data_process }
      else
        format.html { render action: 'new' }
        format.json { render json: @data_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_processes/1
  # PATCH/PUT /data_processes/1.json
  def update
    respond_to do |format|
      if @data_process.update(data_process_params)
        format.html { redirect_to @data_process, notice: 'Data process was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @data_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_processes/1
  # DELETE /data_processes/1.json
  def destroy
    @data_process.destroy
    respond_to do |format|
      format.html { redirect_to data_processes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_process
      @data_process = DataProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_process_params
      params.require(:data_process).permit(:playground_id, :name, :description, :created_by, :updated_by, :owner_id, :scope_id, :business_object_id, :odq_unique_id, :odq_object_id, :last_run_at, :next_run_at, :status_id, :loaded, :inserted, :updated, :deleted, :rejected, :last_run_end, :duration)
    end
end
