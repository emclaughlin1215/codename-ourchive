json.array!(@work_tags) do |work_tag|
  json.extract! work_tag, :id, :tag_id, :work_id
  json.url work_tag_url(work_tag, format: :json)
end
