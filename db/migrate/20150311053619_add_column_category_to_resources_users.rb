class AddColumnCategoryToResourcesUsers < ActiveRecord::Migration
  def change
    add_column :resources_users, :resource_category, :string
    drop_column :resources_users, :resource_id, :integer
  end
end
