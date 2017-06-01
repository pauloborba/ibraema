json.extract! donation, :id, :amount, :last_execution, :user_id, :created_at, :updated_at
json.url donation_url(donation, format: :json)
