class AddColumnsToResourcesUsers < ActiveRecord::Migration
  def change
    add_column :resources_users, :like_request, :boolean, default: false
    add_column :resources_users, :like_accept, :boolean, default: false
    add_column :resources_users, :like_reject, :boolean, default: false
  end
end
