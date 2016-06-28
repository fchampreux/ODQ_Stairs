class BoAttributesImportsController < ApplicationController
  def new
    @business_object = BusinessObject.find(params[:business_object_id]) 
    @bo_attributes_import = BoAttributesImport.new
  end

  def create    
    @business_object = BusinessObject.find(params[:id]) 
    @bo_attributes_import = @business_object.bo_attributes_imports.build(params[:bo_attributes_import])
    if @bo_attributes_import.save
      redirect_to root_url, notice: "Imported Business Object attributes successfully."
    else
      render :new
    end
  end
end