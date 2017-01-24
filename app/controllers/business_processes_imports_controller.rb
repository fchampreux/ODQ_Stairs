class BusinessProcessesImportsController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  def new
    @business_processes_import = BusinessProcessesImport.new
  end

  def create 
    @business_processes_import = BusinessProcessesImport.new(params[:business_processes_import])
    if @business_processes_import.save
      redirect_to business_processes_path, notice: t('ImportedBPs')
    else
      render :new
    end
  end
  
end