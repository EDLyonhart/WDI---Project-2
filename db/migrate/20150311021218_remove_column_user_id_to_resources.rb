class RemoveColumnUserIdToResources < ActiveRecord::Migration
  def change
    remove_column :resources, :user_id, :integer
  end
end
