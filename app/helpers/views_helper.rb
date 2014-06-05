module ViewsHelper

  ### display audit tag filename
  def index_audit_tag_for(current_object)
    ratio = (1-current_object.bad_records.to_f / (current_object.all_records.to_f+1)) * 100
    image_file = case ratio 
      when red_threshold..yellow_threshold then red_image 
      when yellow_threshold..green_threshold then yellow_image
      else green_image
    end
    return image_file
  end

end

