module ViewsHelper

  ### select audit tag filename
  def index_audit_tag_for(current_object)
    image_file = case current_object.score 
      when red_threshold..yellow_threshold then red_image 
      when yellow_threshold..green_threshold then yellow_image
      else green_image
    end
    return image_file
  end

  ### extract object scores chart series
  def scores_chart_series(object_id)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = DimTime.where("period_day = ?", current_period_day).take.period_id
    first_period_id = current_period_id - time_excursion
    measures_by_day = DmMeasure.where("period_id between ? and ? and ODQ_object_id = ?", first_period_id, current_period_id, object_id).select("score, period_id").order("period_id")
      (first_period_id..current_period_id).map do |date|
      score = measures_by_day.detect { |measure| measure.period_id == date }
      score || 0
    end
  end

  ### extract children errors chart series 
  def errors_chart_series (object_id, start_time)

  end

end

