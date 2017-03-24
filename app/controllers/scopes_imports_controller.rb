class ScopesImportsController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!
  
  def new
    @scopes_import = ScopesImport.new
  end

  def create 
    @scopes_import = ScopesImport.new(params[:scopes_import])
    if @scopes_import.save
      redirect_to scopes_path, notice: t('ImportedScs')
    else
      render :new
    end
  end
  
end