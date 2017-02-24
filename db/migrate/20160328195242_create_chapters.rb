class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :work_id
      t.text :chapter_summary
      t.integer :chapter_number
      t.text :body_text
      t.string :body_audio
      t.string :body_image

      t.timestamps null: false
    end
  end
end
