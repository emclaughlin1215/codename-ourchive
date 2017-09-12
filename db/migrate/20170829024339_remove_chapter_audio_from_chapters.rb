class RemoveChapterAudioFromChapters < ActiveRecord::Migration[5.0]
  def change
    remove_column :chapters, :chapter_audio
    add_column :chapters, :chapter_audio_data, :string
  end
end
