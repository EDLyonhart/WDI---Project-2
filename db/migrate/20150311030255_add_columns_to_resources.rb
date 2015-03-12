class AddColumnsToResources < ActiveRecord::Migration
  def change
    add_column :resources, :has, :boolean
    add_column :resources, :user_id, :integer
  end
end
