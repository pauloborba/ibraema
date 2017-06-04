json.extract! company, :id, :name, :cnpj, :email, :type, :created_at, :updated_at
json.url company_url(company, format: :json)
