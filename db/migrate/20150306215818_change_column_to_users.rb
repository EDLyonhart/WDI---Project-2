class ChangeColumnToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :uid, :integer
    add_column :users, :uid, :bigint
  end
end
