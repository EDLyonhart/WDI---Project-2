class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_tags, :string, array: true, default: []
    add_column :users, :want_tags, :string, array: true, default: []
  end
end
