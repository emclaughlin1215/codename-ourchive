class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :text
      t.boolean :is_character
      t.boolean :is_theme
      t.boolean :is_primary_pairing
      t.boolean :is_secondary_pairing
      t.boolean :is_fandom

      t.timestamps null: false
    end
  end
end
