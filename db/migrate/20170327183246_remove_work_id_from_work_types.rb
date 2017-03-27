class RemoveWorkIdFromWorkTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :work_types, :work_id
    add_column :work_types, :type_key, :integer
  end
end
