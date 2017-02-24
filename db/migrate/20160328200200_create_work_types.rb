class CreateWorkTypes < ActiveRecord::Migration
  def change
    create_table :work_types do |t|
      t.integer :work_id
      t.integer :type_id

      t.timestamps null: false
    end
  end
end
