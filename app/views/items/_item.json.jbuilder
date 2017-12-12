json.extract! item, :id, :event_id, :category_id, :memo, :registered_at, :amount, :created_at, :updated_at
json.url item_url(item, format: :json)
