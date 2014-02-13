module ParametersHelper

# retrieve the list of statuses
  def set_statuses_list
    @statuses_list = Parameter.where("code=?  AND ? BETWEEN active_from AND active_to", 'LIST_OF_STATUSES' , Time.now ) 
  end 

# retrieve the list of business rules types
  def set_rule_types_list
    @rule_types_list = Parameter.where("code=?  AND ? BETWEEN active_from AND active_to", 'LIST_OF_RULES_TYPES' , Time.now ) 
  end 

# retrieve the assessment feature option
  def display_assessment?
    @myparam = Parameter.where("name=?  AND ? BETWEEN active_from AND active_to", 'Show assessment', Time.now ).take!
    @myparam.param_value == 'Yes'
  end

# retrieve the will_paginate number of lines per page
  def paginate_lines
    @myparam = Parameter.where("name=?  AND ? BETWEEN active_from AND active_to", 'Nb of lines', Time.now ).take!
    @myparam.param_value.to_i
  end

# retrieve the currency
  def display_currency
    @myparam = Parameter.where("name=?  AND ? BETWEEN active_from AND active_to", 'Currency', Time.now ).take!
    @myparam.param_value
  end

# retrieve the currency
  def display_duration
    @myparam = Parameter.where("name=?  AND ? BETWEEN active_from AND active_to", 'Duration unit', Time.now ).take!
    @myparam.param_value
  end


# retrieve the logo filename
  def display_logo
    @myparam = Parameter.where("name=? AND ? BETWEEN active_from AND active_to", 'Logo filename', Time.now ).take!
    @myparam.param_value
  end

# retrieve the list of business severity
  def set_severity_list
    @severity_list = Parameter.where("code=?  AND ? BETWEEN active_from AND active_to", 'LIST_OF_RULES_SEVERITY' , Time.now ) 
  end 

# retrieve the list of business complexity
  def set_complexity_list
    @complexity_list = Parameter.where("code=?  AND ? BETWEEN active_from AND active_to", 'LIST_OF_RULES_COMPLEXITY' , Time.now ) 
  end 

end
