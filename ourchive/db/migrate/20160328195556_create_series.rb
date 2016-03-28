class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.text :series_summary
      t.boolean :is_complete
      t.integer :total_works

      t.timestamps null: false
    end
  end
end
