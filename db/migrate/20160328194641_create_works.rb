class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.text :work_summary
      t.boolean :is_series
      t.boolean :is_complete
      t.integer :series_id
      t.integer :collection_id
      t.integer :word_count
      t.integer :total_chapters

      t.timestamps null: false
    end
  end
end
