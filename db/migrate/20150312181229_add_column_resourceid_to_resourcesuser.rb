class AddColumnResourceidToResourcesuser < ActiveRecord::Migration
  def change
    add_column :resources_users, :resource_id, :integer
  end
end
