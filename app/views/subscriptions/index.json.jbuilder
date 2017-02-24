json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :user_id, :work_id, :subscribee_id, :is_user_subscription
  json.url subscription_url(subscription, format: :json)
end
