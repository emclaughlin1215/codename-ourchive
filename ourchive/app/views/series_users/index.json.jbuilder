json.array!(@series_users) do |series_user|
  json.extract! series_user, :id, :series_id, :user_id
  json.url series_user_url(series_user, format: :json)
end
