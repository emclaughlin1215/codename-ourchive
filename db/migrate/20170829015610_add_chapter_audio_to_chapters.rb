class AddChapterAudioToChapters < ActiveRecord::Migration[5.0]
  def change
    add_column :chapters, :chapter_audio_data, :string
  end
end
