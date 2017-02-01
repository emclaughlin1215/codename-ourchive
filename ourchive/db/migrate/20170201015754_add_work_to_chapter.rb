class AddWorkToChapter < ActiveRecord::Migration
  def change
    remove_column :chapters, :work_id
    add_reference :chapters, :work, index: true
  end
end
