class CreateBlacklists < ActiveRecord::Migration
  def change
    create_table :blacklists do |t|
      t.integer :user_id
      t.integer :author_id
      t.integer :tag_id
      t.string :phrase

      t.timestamps null: false
    end
  end
end
