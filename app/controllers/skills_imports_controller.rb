class SkillsImportsController < ApplicationController
  def new
    @business_object = BusinessObject.find(params[:business_object_id]) 
    @skills_import = SkillsImport.new
  end

  def create    
    @business_object = BusinessObject.find(params[:business_object_id]) 
    @skills_import = @business_object.skills_import.build(params[:skills_import])
    if @skills_import.save
      redirect_to root_url, notice: "Imported Business Object attributes successfully."
    else
      render :new
    end
  end
  
    ### strong parameters
  def skills_params
    skills_attributes = [:name, :description, :is_key, :is_published, :skill_type_id, :skill_size, :skill_precision]
  end

end