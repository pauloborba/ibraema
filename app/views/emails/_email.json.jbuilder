json.extract! email, :id, :subject, :message, :mark, :created_at, :updated_at
json.url email_url(email, format: :json)
