class CreateWorkTags < ActiveRecord::Migration
  def change
    create_table :work_tags do |t|
      t.integer :tag_id
      t.integer :work_id

      t.timestamps null: false
    end
  end
end
