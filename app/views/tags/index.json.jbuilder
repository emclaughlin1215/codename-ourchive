json.array!(@tags) do |tag|
  json.extract! tag, :id, :text, :is_character, :is_theme, :is_primary_pairing, :is_secondary_pairing, :is_fandom
  json.url tag_url(tag, format: :json)
end
