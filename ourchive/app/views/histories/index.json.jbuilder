json.array!(@histories) do |history|
  json.extract! history, :id, :user_id, :work_id, :type_id, :viewed, :finished
  json.url history_url(history, format: :json)
end
