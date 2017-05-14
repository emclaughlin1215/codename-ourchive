class RemoveBodyAudioFromChapters < ActiveRecord::Migration[5.0]
  def change
    remove_column :chapters, :body_audio
  end
end
