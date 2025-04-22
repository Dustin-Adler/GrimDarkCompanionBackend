json.extract! user, :id, :username, :email, :password_digest, :session_token, :time_zone, :created_at, :updated_at
json.url user_url(user, format: :json)
