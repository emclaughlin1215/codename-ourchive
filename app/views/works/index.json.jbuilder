json.array!(@works) do |work|
  json.extract! work, :id, :work_summary, :is_series, :is_complete, :series_id, :collection_id, :word_count, :total_chapters
  json.url work_url(work, format: :json)
end
