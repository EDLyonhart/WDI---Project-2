class AddColumnsToResourcesUsers < ActiveRecord::Migration
  def change
    add_column :resources_users, :like_request, :boolean
    add_column :resources_users, :like_accept, :boolean
    add_column :resources_users, :like_reject, :boolean
  end
end
