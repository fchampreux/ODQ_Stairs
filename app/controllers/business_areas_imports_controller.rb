class BusinessAreasImportsController < ApplicationController
  def new
    @business_areas_import = BusinessAreasImport.new
  end

  def create 
    @business_areas_import = BusinessAreasImport.new(params[:business_areas_import])
    if @business_areas_import.save
      redirect_to business_areas_path, notice: t('ImportedBAs')
    else
      render :new
    end
  end
  
end