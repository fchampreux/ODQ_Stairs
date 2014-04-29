json.array!(@requests) do |request|
  json.extract! request, :type, :, :who, :, :when, :, :observation, :
  json.url request_url(request, format: :json)
end
