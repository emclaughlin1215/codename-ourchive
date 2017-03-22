class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :tags, :is_fandom
    remove_column :tags, :is_character
    remove_column :tags, :is_primary_pairing
    remove_column :tags, :is_secondary_pairing
    remove_column :tags, :is_theme
    add_column :tags, :type_key, :integer
  end
end
