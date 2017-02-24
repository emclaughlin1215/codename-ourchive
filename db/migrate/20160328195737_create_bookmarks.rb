class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :work_id
      t.integer :tag_id
      t.string :description
      t.boolean :is_private

      t.timestamps null: false
    end
  end
end
