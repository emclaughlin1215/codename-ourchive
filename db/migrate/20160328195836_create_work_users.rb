class CreateWorkUsers < ActiveRecord::Migration
  def change
    create_table :work_users do |t|
      t.integer :work_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
