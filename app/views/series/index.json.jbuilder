json.array!(@series) do |series|
  json.extract! series, :id, :series_summary, :is_complete, :total_works
  json.url series_url(series, format: :json)
end
