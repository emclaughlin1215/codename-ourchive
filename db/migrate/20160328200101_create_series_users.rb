class CreateSeriesUsers < ActiveRecord::Migration
  def change
    create_table :series_users do |t|
      t.integer :series_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
