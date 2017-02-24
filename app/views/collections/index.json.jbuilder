json.array!(@collections) do |collection|
  json.extract! collection, :id, :mod_id, :date_open, :date_closed, :moderation_type, :challenge_description
  json.url collection_url(collection, format: :json)
end
