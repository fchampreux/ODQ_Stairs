module ViewsHelper

  ### provide full title of a page
  def full_title(page_title)
    base_title = "Data Quality Stairs"
    if page_title.empty?
      base_title
    else
      "#{base_title} - #{page_title}"
    end
  end
  
  ### select audit tag filename
  def index_audit_tag_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = DimTime.where("period_day = ?", current_period_day).take.period_id
    if DmMeasure.where("period_id = ? and ODQ_object_id = ?", current_period_id, current_object.id).blank?
      measured_score = -1
    else  
      measured_score = DmMeasure.where("period_id = ? and ODQ_object_id = ?", current_period_id, current_object.id).first.score
    end
    
    image_file = case measured_score
      when -1 then grey_image     
      when red_threshold..yellow_threshold then red_image 
      when yellow_threshold..green_threshold then yellow_image
      else green_image
    end
    return image_file
  end
  
  ### extract object's scores chart series
  def scores_chart_series_for(current_object)
    current_period_id = DimTime.where("period_date = ?", Time.now.to_date).take.period_id
    measured_history = DmMeasure.where("period_id between ? and ? and ODQ_object_id = ?", current_period_id - date_excursion, current_period_id, current_object.id).select("period_id, score").order("period_id")
    (current_period_id - date_excursion..current_period_id).map do |period|
      measure = measured_history.detect { |measure| measure.period_id == period }
      measure && measure.score || 0
    end
  end

  ### extract object's children errors chart series
  def errors_chart_series_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = DimTime.where("period_day = ?", current_period_day).take.period_id
    measured_children = DmMeasure.where("period_id = ? and ODQ_parent_id = ? and score < 100", current_period_id, current_object.id).select("odq_object_id as id, odq_object_name as name, odq_object_code as code, error_count, odq_object_url as url")
  end
  
    ### extract object's children added value chart series
  def added_value_chart_series_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = DimTime.where("period_day = ?", current_period_day).take.period_id
    measured_children = DmMeasure.where("period_id = ? and ODQ_parent_id = ? and score < 100", current_period_id, current_object.id).select("odq_object_id as id, odq_object_name as name, odq_object_code as code, added_value, odq_object_url as url")
  end
  
    ### extract object's children workload chart series
  def workload_chart_series_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = DimTime.where("period_day = ?", current_period_day).take.period_id
    measured_children = DmMeasure.where("period_id = ? and ODQ_parent_id = ? and score < 100", current_period_id, current_object.id).select("odq_object_id as id, odq_object_name as name, odq_object_code as code, workload, odq_object_url as url")
  end

end

