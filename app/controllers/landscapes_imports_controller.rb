class LandscapesImportsController < ApplicationController
  def new
    @landscapes_import = LandscapesImport.new
  end

  def create 
    @landscapes_import = LandscapesImport.new(params[:landscapes_import])
    if @landscapes_import.save
      redirect_to landscapes_path, notice: t('ImportedLSs')
    else
      render :new
    end
  end
  
end