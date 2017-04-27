json.extract! user, :id, :nome, :email, :password, :subscription, :created_at, :updated_at
json.url user_url(user, format: :json)
