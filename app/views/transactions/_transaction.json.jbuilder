json.extract! transaction, :id, :product_id, :shelter_id, :transaction_type, :quantity, :transaction_date :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
