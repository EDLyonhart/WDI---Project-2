class RenameColumnsToResoucesUsers < ActiveRecord::Migration
  def change
    rename_column :resources_users, :user_id, :user_wants_id
    rename_column :resources_users, :has_user_id, :user_has_id
  end
end
