json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :work_id, :chapter_summary, :chapter_number, :body_text, :body_audio, :body_image
  json.url chapter_url(chapter, format: :json)
end
