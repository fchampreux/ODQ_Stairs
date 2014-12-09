json.array!(@data_processes) do |data_process|
  json.extract! data_process, :playground_id, :name, :description, :created_by, :updated_by, :owner_id, :scope_id, :business_object_id, :odq_unique_id, :odq_object_id, :last_run_at, :next_run_at, :status_id, :loaded, :inserted, :updated, :deleted, :rejected, :last_run_end, :duration
  json.url data_process_url(data_process, format: :json)
end
