class BusinessObjectsImportsController < ApplicationController
  def new
    @business_objects_import = BusinessObjectsImport.new
  end

  def create 
    @business_objects_import = BusinessObjectsImport.new(params[:business_objects_import])
    if @business_objects_import.save
      redirect_to business_objects_path, notice: t('ImportedBOs')
    else
      render :new
    end
  end
  
end