class AddWorkTypeToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :work_type, :integer
  end
end
