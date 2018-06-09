module PlaygroundsHelper
  
  def list_of_playgrounds
    list_of_playgrounds = Playground.all.select ("id, code") # may be limited by access rights in the future
  end
  
end
