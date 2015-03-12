class AddColumnToResourcesUsers < ActiveRecord::Migration
  def change
    add_column :resources_users, :resource_id, :integer
    remove_column :resources_users, :resource_category
  end
end
