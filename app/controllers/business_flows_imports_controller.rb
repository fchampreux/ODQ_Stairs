class BusinessFlowsImportsController < ApplicationController
  # Check for active session 
  before_action :signed_in_user
  
  def new
    @business_flows_import = BusinessFlowsImport.new
  end

  def create 
    @business_flows_import = BusinessFlowsImport.new(params[:business_flows_import])
    if @business_flows_import.save
      redirect_to business_flows_path, notice: t('ImportedBFs')
    else
      render :new
    end
  end
  
end