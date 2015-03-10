json.array!(@beehives) do |beehive|
  json.extract! beehive, :id, :name, :position, :mode, :user_id
  json.url beehive_url(beehive, format: :json)
end
