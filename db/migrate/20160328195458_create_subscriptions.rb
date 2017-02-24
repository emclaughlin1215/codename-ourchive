class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :work_id
      t.integer :subscribee_id
      t.boolean :is_user_subscription

      t.timestamps null: false
    end
  end
end
