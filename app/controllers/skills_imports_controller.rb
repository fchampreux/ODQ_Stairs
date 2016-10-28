class SkillsImportsController < ApplicationController
  def new
    @business_object = BusinessObject.find(params[:business_object_id]) 
    @skills_import = SkillsImport.new
  end

  def create    
    @business_object = BusinessObject.find(params[:business_object_id]) 
    @skills_import = SkillsImport.new(params[:skills_import])
    if @skills_import.save
      redirect_to business_object_path(@business_object), notice: "Imported Business Object attributes successfully."
    else
      render :new
    end
  end
  
end