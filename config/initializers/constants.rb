$VERSION = 'version 1.0'
$RedThreshold = red_threshold
$RedImage = red_image
$Yellowhreshold = yellow_threshold
$YellowImage = yellow_image
$GreenThreshold = green_threshold
$GreenImage = green_image

private

# retrieve the traffic lights levels and filenames
  def red_threshold
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 3-Red light', Time.now ).take!
    @myparam.property.to_i
  end

  def red_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 3-Red light', Time.now ).take!
    @myparam.code
  end

  def yellow_threshold
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 2-Yellow light', Time.now ).take!
    @myparam.property.to_i
  end

  def yellow_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 2-Yellow light', Time.now ).take!
    @myparam.code
  end

  def green_threshold
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 1-Green light', Time.now ).take!
    @myparam.property.to_i
  end

  def green_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 1-Green light', Time.now ).take!
    @myparam.code
  end

  def grey_image
    list_id = ParametersList.where("code=?", 'LIST_OF_DISPLAY_PARAMETERS').take!
    @myparam = Parameter.where("parameters_list_id=? AND name=? AND ? BETWEEN active_from AND active_to", list_id, 'Tag 4-Grey light', Time.now ).take!
    @myparam.code
  end
