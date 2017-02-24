class CreateModerationTypes < ActiveRecord::Migration
  def change
    create_table :moderation_types do |t|
      t.integer :moderation_type
      t.string :moderation_description

      t.timestamps null: false
    end
  end
end
