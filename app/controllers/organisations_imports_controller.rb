class OrganisationsImportsController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  def new
    @organisations_import = OrganisationsImport.new
  end

  def create 
    @organisations_import = OrganisationsImport.new(params[:organisations_import])
    if @organisations_import.save
      redirect_to organisations_path, notice: t('ImportedOrgs')
    else
      render :new
    end
  end
  
end