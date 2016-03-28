class CreateBookmarkTags < ActiveRecord::Migration
  def change
    create_table :bookmark_tags do |t|
      t.integer :user_id
      t.string :text

      t.timestamps null: false
    end
  end
end
