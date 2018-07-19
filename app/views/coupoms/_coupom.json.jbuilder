json.extract! coupom, :id, :value, :key, :expiration, :created_at, :updated_at
json.url coupom_url(coupom, format: :json)
