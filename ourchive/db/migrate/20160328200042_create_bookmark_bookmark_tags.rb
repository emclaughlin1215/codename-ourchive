class CreateBookmarkBookmarkTags < ActiveRecord::Migration
  def change
    create_table :bookmark_bookmark_tags do |t|
      t.integer :bookmark_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
