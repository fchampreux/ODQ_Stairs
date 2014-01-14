module ParametersHelper

# retrieve the list of statuses
  def set_statuses_list
    @statuses_list = Parameter.where("code=? AND is_list=? AND ? BETWEEN active_from AND active_to", 'LIST_OF_STATUSES' , false, Time.now ) 
  end 

# retrieve the list of business rules types
  def set_rule_types_list
    @rule_types_list = Parameter.where("code=? AND is_list=? AND ? BETWEEN active_from AND active_to", 'LIST_OF_RULES_TYPES' , false, Time.now ) 
  end 

# retrieve the assessment feature option
  def display_assessment?
    myparam = Parameter.where("name=? AND is_list=? AND ? BETWEEN active_from AND active_to", 'Show assessment', false, Time.now ).take!
    myparam.param_value == 'Yes'
  end

# retrieve the will_paginate number of lines per page
  def paginate_lines
    myparam = Parameter.where("name=? AND is_list=? AND ? BETWEEN active_from AND active_to", 'Nb of lines', false, Time.now ).take!
    myparam.param_value.to_i
  end

end
