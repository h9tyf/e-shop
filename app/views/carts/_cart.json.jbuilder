json.extract! cart, :id, :user_id, :product_option_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)