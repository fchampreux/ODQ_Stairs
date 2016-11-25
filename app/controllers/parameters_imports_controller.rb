class ParametersImportsController < ApplicationController
  def new
    @parameters_list = ParametersList.find(params[:parameters_list_id]) 
    @parameters_import = ParametersImport.new
  end

  def create    
    @parameters_list = ParametersList.find(params[:parameters_list_id]) 
    @parameters_import = ParametersImport.new(params[:parameters_import])
    if @parameters_import.save
      redirect_to parameters_list_path(@parameters_list), notice: t('ImportedPs')
    else
      render :new
    end
  end
  
end