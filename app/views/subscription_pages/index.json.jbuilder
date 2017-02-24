json.array!(@subscription_pages) do |subscription_page|
  json.extract! subscription_page, :id, :user_id, :work_id, :finished
  json.url subscription_page_url(subscription_page, format: :json)
end
