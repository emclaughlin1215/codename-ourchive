class AddTypeNameToWorkType < ActiveRecord::Migration[5.0]
  def change
    add_column :work_types, :type_name, :string
  end
end
