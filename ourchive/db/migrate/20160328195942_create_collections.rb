class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :mod_id
      t.timestamp :date_open
      t.timestamp :date_closed
      t.integer :moderation_type
      t.string :challenge_description

      t.timestamps null: false
    end
  end
end
