class RemoveColumnToResources < ActiveRecord::Migration
  def change
    remove_column :resources, :has, :boolean
  end
end
