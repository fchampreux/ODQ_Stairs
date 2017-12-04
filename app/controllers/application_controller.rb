class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper, ParametersHelper, UsersHelper, ViewsHelper, ControllersHelper
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added_attrs = [:email, :first_name, :last_name, :language, :language_id, :description, :playground_id, :user_name, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
