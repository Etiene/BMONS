json.array!(@alerts) do |alert|
  json.extract! alert, :id, :type, :frequency, :message, :threshold, :comparison, :active, :user_id, :sensor_id
  json.url alert_url(alert, format: :json)
end
