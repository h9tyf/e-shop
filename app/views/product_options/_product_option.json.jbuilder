json.extract! product_option, :id, :description, :price, :product_id, :created_at, :updated_at
json.url shop_product_product_option_url(product_option, format: :json)
