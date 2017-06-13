json.extract! email, :id, :subject, :message, :mark, :resent, :created_at, :updated_at
json.url email_url(email, format: :json)
