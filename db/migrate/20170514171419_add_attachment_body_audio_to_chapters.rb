class AddAttachmentBodyAudioToChapters < ActiveRecord::Migration
  def self.up
    change_table :chapters do |t|
      t.attachment :body_audio
    end
  end

  def self.down
    remove_attachment :chapters, :body_audio
  end
end
