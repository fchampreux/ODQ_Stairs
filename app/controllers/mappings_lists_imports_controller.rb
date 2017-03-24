class MappingsListsImportsController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!
  
  def new
    @mappings_lists_import = MappingsListsImport.new
  end

  def create 
    @mappings_lists_import = MappingsListsImport.new(params[:mappings_lists_import])
    if @mappings_lists_import.save
      redirect_to mappings_lists_path, notice: t('ImportedMaps')
    else
      render :new
    end
  end
  
end