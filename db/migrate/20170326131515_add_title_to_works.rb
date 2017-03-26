class AddTitleToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :title, :string
  end
end
