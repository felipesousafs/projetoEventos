json.extract! event, :id, :name, :description, :event_type_id, :user_id, :tags, :created_at, :updated_at
json.url event_url(event, format: :json)
