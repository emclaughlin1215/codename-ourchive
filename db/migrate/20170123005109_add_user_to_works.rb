class AddUserToWorks < ActiveRecord::Migration
  def change
    add_column :works, :user_id, :integer
    add_reference :works, :users, index: true
    add_foreign_key :works, :users
  end
end
