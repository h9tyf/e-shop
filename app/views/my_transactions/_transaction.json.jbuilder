json.extract! transaction, :id, :user_id, :created_at, :updated_at
json.url myTransaction_url(transaction, format: :json)
