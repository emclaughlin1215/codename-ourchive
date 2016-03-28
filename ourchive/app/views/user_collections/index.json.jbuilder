json.array!(@user_collections) do |user_collection|
  json.extract! user_collection, :id, :user_id, :collection_id
  json.url user_collection_url(user_collection, format: :json)
end
