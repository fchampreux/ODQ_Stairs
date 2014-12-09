module ParametersHelper

# retrieve the list of statuses
  def set_statuses_list
    list_id = ParametersList.where("code=?", 'LIST_OF_STATUSES').take!
    @statuses_list = Parameter.where("parameters_list_id=?  AND ? BETWEEN active_from AND active_to", list_id, Time.now ) 
  end 

# retrieve the list of breach statuses
  def set_breach_statuses_list
    list_id = ParametersList.where("code=?", 'LIST_OF_BREACH_STATUSES').take!
    @breach_statuses_list = Parameter.where("parameters_list_id=?  AND ? BETWEEN active_from AND active_to", list_id, Time.now ) 
  end
  
  # retrieve the list of notifications statuses
  def set_notification_statuses_list
    list_id = ParametersList.where("code=?", 'LIST_OF_BREACH_STATUSES').take!
    @notification_statuses_list = Parameter.where("parameters_list_id=?  AND ? BETWEEN active_from AND active_to", list_id, Time.now ) 
  end 

# retrieve the list of breach types
#  def set_breach_types_list
#    list_id = ParametersList.where("code=?", 'LIST_OF_BREACH_TYPES').take!
#    @breach_types_list = Parameter.where("parameters_list_id=?  AND ? BETWEEN active_from AND active_to", list_id, Time.now ) 
#  end 

# retrieve the list of business rules types
  def set_rule_types_list
    list_id = ParametersList.where("code=?", 'LIST_OF_RULES_TYPES').take!
    @rule_types_list = Parameter.where("parameters_list_id=?  AND ? BETWEEN active_from AND active_to", list_id, Time.now ) 
  end 

# retrieve the list of business severity
  def set_severity_list
    list_id = ParametersList.where("code=?", 'LIST_OF_RULES_SEVERITY').take!
    @severity_list = Parameter.where("parameters_list_id=?  AND ? BETWEEN active_from AND active_to", list_id, Time.now ) 
  end 

# retrieve the list of business complexity
  def set_complexity_list
    list_id = ParametersList.where("code=?", 'LIST_OF_RULES_COMPLEXITY').take!
    @complexity_list = Parameter.where("parameters_list_id=?  AND ? BETWEEN active_from AND active_to", list_id, Time.now ) 
  end 

### Ajouter le filtre owner=current_user pour les listes 'user specific'
# retrieve the assessment feature option
  def display_assessment?
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=?  AND ? BETWEEN active_from AND active_to", list_id, 'Show assessment', Time.now ).take!
    @myparam.param_value == 'Yes'
  end

# retrieve the will_paginate number of lines per page
  def paginate_lines
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=?  AND ? BETWEEN active_from AND active_to", list_id, 'Nb of lines', Time.now ).take!
    @myparam.param_value.to_i
  end

# retrieve the currency
  def display_currency
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=?  AND ? BETWEEN active_from AND active_to", list_id, 'Currency', Time.now ).take!
    @myparam.param_value
  end

# retrieve the duration unit
  def display_duration
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=?  AND ? BETWEEN active_from AND active_to", list_id, 'Duration unit', Time.now ).take!
    @myparam.param_value
  end

# retrieve the time excursion for displaying history in objects tab
  def date_excursion
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=?  AND ? BETWEEN active_from AND active_to", list_id, 'Date excursion', Time.now ).take!
    @myparam.param_value.to_i
  end

# retrieve the logo filename
  def display_logo
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Logo filename', Time.now ).take!
    @myparam.param_value
  end

# retrieve the traffic lights levels and filenames
  def red_threshold
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 3-Red light', Time.now ).take!
    @myparam.param_value.to_i
  end

  def red_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 3-Red light', Time.now ).take!
    @myparam.param_code
  end

  def yellow_threshold
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 2-Yellow light', Time.now ).take!
    @myparam.param_value.to_i
  end

  def yellow_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 2-Yellow light', Time.now ).take!
    @myparam.param_code
  end

  def green_threshold
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 1-Green light', Time.now ).take!
    @myparam.param_value.to_i
  end

  def green_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 1-Green light', Time.now ).take!
    @myparam.param_code
  end

  def grey_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 4-Grey light', Time.now ).take!
    @myparam.param_code
  end
  
# retrieve the list of managed softwares
  def set_softwares_list
    list_id = ParametersList.where("code=?", 'LIST_OF_MANAGED_SOFTWARES').take!
    @softwares_list = Parameter.where("parameters_list_id=? AND ? BETWEEN active_from AND active_to", list_id, Time.now )
  end

end
