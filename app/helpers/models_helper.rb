module ModelsHelper

  ### get playground scoped id for new objects
  def next_id(current_object)
    my_sequence=Sequence.pgnd(current_playground).where("class_name = ?", current_object.class.name).take!
    my_id = my_sequence.current_id + 1
    my_sequence.update(current_id: my_id)
    return my_id
  end
  
  ### get global id for new objects
  def global_id(current_object)
    my_sequence=Sequence.where("playground_id = 0 and class_name = 'Global'").take!
    my_id = my_sequence.current_id + 1
    my_sequence.update(current_id: my_id)
    return my_id
  end
  
  ### initialise object metadata
  def metadata_setup(current_object)
    current_object.updated_by = current_login
    current_object.created_by = current_login
    current_object.playground_id = current_playground
    current_object.owner_id = current_user.id
    current_object.odq_object_id = next_id(current_object)
    current_object.odq_unique_id = global_id(current_object)
  end
end
