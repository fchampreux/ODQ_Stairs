json.array!(@parameters_lists) do |parameters_list|
  json.extract! parameters_list, 
  json.url parameters_list_url(parameters_list, format: :json)
end
