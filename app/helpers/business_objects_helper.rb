module BusinessObjectsHelper
  
  def list_of_scopes(current_object)
    scopes_list=Scope.where("business_object_id = ?", current_object.id)
  end
  
end
