json.array!(@types) do |type|
  json.extract! type, :id, :type_title, :type_description
  json.url type_url(type, format: :json)
end
