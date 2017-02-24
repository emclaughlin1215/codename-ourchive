json.array!(@bookmark_tags) do |bookmark_tag|
  json.extract! bookmark_tag, :id, :user_id, :text
  json.url bookmark_tag_url(bookmark_tag, format: :json)
end
