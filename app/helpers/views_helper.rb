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
    if DmProcess.where("period_id = ? and ODQ_object_id = ?", current_period_id, current_object.id).blank?
      measured_score = -1
    else  
      measured_score = DmProcess.where("period_id = ? and ODQ_object_id = ?", current_period_id, current_object.id).first.score
    end

# Use constants initialized at startup instead of parameters queried foreach line
=begin 
    image_file = case measured_score
      when -1 then grey_image     
      when green_threshold..100 then green_image
      when yellow_threshold..green_threshold then yellow_image 
      else red_image
    end
=end
    image_file = case measured_score
      when -1 then $GreyImage     
      when $GreenThreshold..100 then $GreenImage
      when $YellowThreshold..$GreenThreshold then $YellowImage 
      else $RedImage
    end

    return image_file
  end
  
  # retrieve the list of playgrounds
  def set_playgrounds_list
    @playgrounds_list = Playground.where("id > 0")
  end 
  
  def current_period_id
      current_period_id = TimeScale.where("period_date = ?", Time.now.to_date).take.period_id
  end
  
  def history_date
    DimTime.find(current_period_id - date_excursion).period_date
  end
  
  ### extract object's series for d3
  def d3_chart_series_for(current_object)
    measured_history = DmProcess.joins("inner join odq_dwh.dim_time on dim_time.period_id = dm_processes.period_id").
    where("dim_time.period_id between ? and ? and ODQ_object_id = ? and dm_processes.playground_id = ?",
          current_period_id - date_excursion, current_period_id, current_object.id, current_user.current_playground_id).
    select("dim_time.period_date idx, score").order("dim_time.period_date")
  end

=begin
  ### extract object's children errors chart series
  def d3_errors_chart_series_for(current_object)
    measured_children = DmProcess.where("period_id = ? and ODQ_parent_id = ? and score > 0", current_period_id, current_object.id).
    where("odq_object_id <> odq_parent_id").
    select("odq_object_id, odq_object_name, odq_object_code, error_count, added_value, workload, odq_object_url")
  end
  
  ### extract object's errors chart series for dc with cross-filter
  def dc_chart_series_for(current_object)
    measured_history = DmProcess.joins("inner join odq_dwh.dim_time on dim_time.period_id = dm_processes.period_id").
    where("dim_time.period_id between ? and ? and ODQ_object_id = ?",current_period_id - date_excursion, current_period_id, current_object.id).
    where("score > 0").
    select("dm_processes.period_id, dim_time.period_date, odq_object_id, odq_object_name, odq_object_code, score")
  end
=end  
    ### extract object's childrens' errors chart series for dc with cross-filter
  def d3_chart_child_series_for(current_object)
    measured_children = DmProcess.joins("inner join odq_dwh.dim_time on dim_time.period_id = dm_processes.period_id").
    where("dim_time.period_id between ? and ? and ODQ_parent_id = ?",current_period_id - date_excursion, current_period_id, current_object.id).
    where("score > 0").
    where("odq_object_id <> odq_parent_id").
    select("dm_processes.period_id, dim_time.period_date, odq_object_id, odq_object_name, odq_object_code, score, error_count, added_value, workload, odq_object_url")
  end

=begin  
    ### extract object's children added value chart series
  def added_value_chart_series_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = TimeScale.where("period_day = ?", current_period_day).take.period_id
    measured_children = DmProcess.where("period_id = ? and ODQ_parent_id = ? and score < 100", current_period_id, current_object.id).where("odq_object_id <> odq_parent_id").select("odq_object_id as id, odq_object_name as name, odq_object_code as code, added_value, odq_object_url as url")
  end
  
    ### extract object's children workload chart series
  def workload_chart_series_for(current_object)
    current_period_day = Time.now.strftime("%Y%m%d")
    current_period_id = TimeScale.where("period_day = ?", current_period_day).take.period_id
    measured_children = DmProcess.where("period_id = ? and ODQ_parent_id = ? and score < 100", current_period_id, current_object.id).where("odq_object_id <> odq_parent_id").select("odq_object_id as id, odq_object_name as name, odq_object_code as code, workload, odq_object_url as url")
  end
=end

end

