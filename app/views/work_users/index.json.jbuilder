json.array!(@work_users) do |work_user|
  json.extract! work_user, :id, :work_id, :user_id
  json.url work_user_url(work_user, format: :json)
end
