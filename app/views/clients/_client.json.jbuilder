json.extract! client, :id, :first_name, :last_name, :dni, :phone_number, :birthday, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
