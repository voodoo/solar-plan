json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :ip, :token
  json.url plan_url(plan, format: :json)
end
