json.array!(@moderation_types) do |moderation_type|
  json.extract! moderation_type, :id, :moderation_type, :moderation_description
  json.url moderation_type_url(moderation_type, format: :json)
end
