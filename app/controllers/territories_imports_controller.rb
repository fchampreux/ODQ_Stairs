class TerritoriesImportsController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  def new
    @territories_import = TerritoriesImport.new
  end

  def create 
    @territories_import = TerritoriesImport.new(params[:territories_import])
    if @territories_import.save
      redirect_to territories_path, notice: t('ImportedTers')
    else
      render :new
    end
  end
  
end