class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper, ParametersHelper, UsersHelper, ViewsHelper, ControllersHelper, ScopesHelper, PlaygroundsHelper
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  
# Audit trail recording function
  def log_activity(playground_id, task_id, objectId, objectName, server, description, breach_type)
        @trail = AuditTrail.new
        @trail.playground_id = playground_id
        @trail.task_id = task_id
        @trail.action = action_name
        @trail.object_id = objectId || 0
        @trail.object_class = controller_name
        @trail.object_name = objectName
        @trail.server_name = server
        @trail.breach_type_id = breach_type
        @trail.description = description
        @trail.created_by = current_user.user_name
        @trail.save
    end

# Devise permitted parameters
  protected
  def configure_permitted_parameters
    added_attrs = [:email, :first_name, :last_name, :language, :language_id, :description, :playground_id, :user_name, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
