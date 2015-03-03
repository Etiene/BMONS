json.array!(@users) do |user|
  json.extract! user, :id, :name, :access_level, :login, :password_digest, :email, :tel
  json.url user_url(user, format: :json)
end
