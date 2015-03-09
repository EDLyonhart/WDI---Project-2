class ChangeResourcesColumnPresenceToHas < ActiveRecord::Migration
  def change
    rename_column :resources, :presence, :has
  end
end
