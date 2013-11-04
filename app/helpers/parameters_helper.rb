module ParametersHelper

# retrieve the list of statuses
  def set_statuses_list
    @statuses_list = Parameter.where("code=? AND is_list=? AND ? BETWEEN active_from AND active_to", 'LIST_OF_STATUSES' , false, Time.now ) 
  end 

end
