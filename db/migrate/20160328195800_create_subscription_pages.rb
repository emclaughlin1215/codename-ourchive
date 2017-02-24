class CreateSubscriptionPages < ActiveRecord::Migration
  def change
    create_table :subscription_pages do |t|
      t.integer :user_id
      t.integer :work_id
      t.boolean :finished

      t.timestamps null: false
    end
  end
end
