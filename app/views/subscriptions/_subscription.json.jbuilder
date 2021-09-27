json.extract! subscription, :id, :initial_date, :end_date, :price, :payed, :activity_id, :client_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
