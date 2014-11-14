json.array!(@metrics) do |metric|
  json.extract! metric, :id, :successful, :failed, :remaining, :converted, :queued_at, :contents, :api_id, :auth_id, :app_id
  json.url metric_url(metric, format: :json)
end
