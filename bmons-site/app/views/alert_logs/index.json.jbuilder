json.array!(@alert_logs) do |alert_log|
  json.extract! alert_log, :id, :message, :status, :recipient, :datetime, :alert_id
  json.url alert_log_url(alert_log, format: :json)
end
