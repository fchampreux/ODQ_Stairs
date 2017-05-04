class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper, ParametersHelper, UsersHelper, ViewsHelper, ControllersHelper
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :language, :description, :playground_id, :login])
  end
end
