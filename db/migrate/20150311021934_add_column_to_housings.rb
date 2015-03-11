class AddColumnToHousings < ActiveRecord::Migration
  def change
    add_column :housings, :user_id, :integer
  end
end
