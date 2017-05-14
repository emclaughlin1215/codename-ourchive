class RemoveColumnChapter < ActiveRecord::Migration[5.0]
  def change
    remove_column :chapters, :body_image
  end
end
