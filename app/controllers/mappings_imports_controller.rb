class MappingsImportsController < ApplicationController
  def new
    @mappings_list = MappingsList.find(params[:mappings_list_id]) 
    @mappings_import = MappingsImport.new
  end

  def create    
    @mappings_list = MappingsList.find(params[:mappings_list_id]) 
    @mappings_import = MappingsImport.new(params[:mappings_import])
    if @mappings_import.save
      redirect_to mappings_list_path(@mappings_list), notice: t('ImportedMaps')
    else
      render :new
    end
  end
  
end