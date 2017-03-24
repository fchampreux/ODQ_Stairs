class BusinessObjectsImportsController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!
  
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
=begin
    respond_to do |format|
      if @business_objects_import.save
        format.html { redirect_to business_objects_path, notice: t('ImportedBOs') }
        format.json { render action: 'index', status: :created, location: @business_objects }
      else
        format.html { render action: 'new' }
        format.json { render json: @business_objects_import.errors, status: :unprocessable_entity }
      end
    end
=end  
end

