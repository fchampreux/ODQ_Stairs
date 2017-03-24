class BusinessRulesImportsController < ApplicationController
  # Check for active session 
  before_action :authenticate_user!
  
  def new
    @business_rules_import = BusinessRulesImport.new
  end

  def create 
    @business_rules_import = BusinessRulesImport.new(params[:business_rules_import])
    if @business_rules_import.save
      redirect_to business_rules_path, notice: t('ImportedBRs')
    else
      render :new
    end
  end
  
end