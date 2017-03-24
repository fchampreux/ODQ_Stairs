class ValuesListsImportsController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!

  def new
    @values_lists_import = ValuesListsImport.new
  end

  def create 
    @values_lists_import = ValuesListsImport.new(params[:values_lists_import])
    if @values_lists_import.save
      redirect_to values_lists_path, notice: t('ImportedPLs')
    else
      render :new
    end
  end
  
end