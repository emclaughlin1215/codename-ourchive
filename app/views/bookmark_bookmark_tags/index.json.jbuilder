json.array!(@bookmark_bookmark_tags) do |bookmark_bookmark_tag|
  json.extract! bookmark_bookmark_tag, :id, :bookmark_id, :user_id
  json.url bookmark_bookmark_tag_url(bookmark_bookmark_tag, format: :json)
end
