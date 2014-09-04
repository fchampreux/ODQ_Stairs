module ViewsHelper

  ### provide full title of a page
  def full_title(page_title)
    base_title = "Open Data Quality Stairs"
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
    measured_score = DmMeasure.where("period_id = ? and ODQ_object_id = ?", current_period_id, current_object.id).first.score
    image_file = case measured_score 
      when red_threshold..yellow_threshold then red_image 
      when yellow_threshold..green_threshold then yellow_image
      else green_image
    end
    return image_file
  end

  ### extract object scores chart series
  def scores_chart_series_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = DimTime.where("period_day = ?", current_period_day).take.period_id
    first_period_id = current_period_id - time_excursion
    @measured_history = DmMeasure.where("period_id between ? and ? and ODQ_object_id = ?", first_period_id, current_period_id, current_object.id).select("period_day, score").order("period_id")
  end

  ### extract object children errors chart series
  def errors_chart_series_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = DimTime.where("period_day = ?", current_period_day).take.period_id
    @measured_children = DmMeasure.where("period_id = ? and ODQ_parent_id = ? and score < 100", current_period_id, current_object.id).select("odq_object_id, error_count")
  end

end

