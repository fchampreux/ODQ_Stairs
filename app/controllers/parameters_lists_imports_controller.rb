class ParametersListsImportsController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  def new
    @parameters_lists_import = ParametersListsImport.new
  end

  def create 
    @parameters_lists_import = ParametersListsImport.new(params[:parameters_lists_import])
    if @parameters_lists_import.save
      redirect_to parameters_lists_path, notice: t('ImportedPLs')
    else
      render :new
    end
  end
  
end