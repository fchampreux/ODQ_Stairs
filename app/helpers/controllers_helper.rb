module ControllersHelper

  ### initialise object metadata
  def metadata_setup(current_object)
    current_object.updated_by = current_login
    current_object.created_by = current_login
    current_object.playground_id = current_playground
    current_object.owner_id = current_user.id
#    current_object.odq_object_id = current_object.id
  end
end
