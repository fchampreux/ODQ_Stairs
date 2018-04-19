class BusinessHierarchyImportsController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!
  before_action :set_playgrounds_list
  
  def new
    @business_hierarchy_import = BusinessHierarchyImport.new
  end

  def create 
    @business_hierarchy_import = BusinessHierarchyImport.new(params[:business_hierarchy_import])
    if @business_hierarchy_import.save
      redirect_to business_hierarchies_path, notice: t('ImportedBHs')
    else
      render :new
    end
  end

end