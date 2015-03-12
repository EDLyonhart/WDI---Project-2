class AlterColumnsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :has_tags
    remove_column :users, :want_tags
    add_column :users, :has_bike, :boolean, default: false
    add_column :users, :has_housing, :boolean, default: false
    add_column :users, :has_pet, :boolean, default: false
    add_column :users, :has_social, :boolean, default: false
    add_column :users, :has_vehicle, :boolean, default: false
    add_column :users, :wants_bike, :boolean, default: false
    add_column :users, :wants_housing, :boolean, default: false
    add_column :users, :wants_pet, :boolean, default: false
    add_column :users, :wants_social, :boolean, default: false
    add_column :users, :wants_vehicle, :boolean, default: false

  end
end


