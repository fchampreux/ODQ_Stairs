module PlaygroundsHelper

  
  # retrieve the list of playgrounds 
  def list_of_playgrounds
    Playground.where("id > 0").select("id, code, name") # may be limited by access rights in the future
  end

=begin  
  # retrieve the list of playgrounds
  def set_playgrounds_list
    @playgrounds_list = Playground.where("id > 0").map{ |playground| [playground.name, playground.id]}
  end
=end

end
