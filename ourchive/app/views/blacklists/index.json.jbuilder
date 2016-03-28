json.array!(@blacklists) do |blacklist|
  json.extract! blacklist, :id, :user_id, :author_id, :tag_id, :phrase
  json.url blacklist_url(blacklist, format: :json)
end
