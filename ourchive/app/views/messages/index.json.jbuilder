json.array!(@messages) do |message|
  json.extract! message, :id, :from_user_id, :to_user_id, :subject, :body, :is_admin, :read
  json.url message_url(message, format: :json)
end
