json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id, :user_id, :work_id, :tag_id, :description, :is_private
  json.url bookmark_url(bookmark, format: :json)
end
