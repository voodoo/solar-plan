json.array!(@items) do |item|
  json.extract! item, :id, :name, :watts, :hours, :priority, :plan_id, :active
  json.url item_url(item, format: :json)
end
