class AddAttachmentBodyImageToChapters < ActiveRecord::Migration
  def self.up
    change_table :chapters do |t|
      t.attachment :body_image
    end
  end

  def self.down
    remove_attachment :chapters, :body_image
  end
end
