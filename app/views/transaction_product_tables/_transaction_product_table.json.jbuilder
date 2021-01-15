json.extract! transaction_product_table, :id, :transaction_id, :product_option_id, :created_at, :updated_at
json.url transaction_product_table_url(transaction_product_table, format: :json)
