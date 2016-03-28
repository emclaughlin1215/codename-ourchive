class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :work_id
      t.integer :type_id
      t.boolean :viewed
      t.boolean :finished

      t.timestamps null: false
    end
  end
end
