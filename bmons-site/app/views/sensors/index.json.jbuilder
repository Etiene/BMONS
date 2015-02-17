json.array!(@sensors) do |sensor|
  json.extract! sensor, :id, :name, :type, :unity, :beehive_id
  json.url sensor_url(sensor, format: :json)
end
