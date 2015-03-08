class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :score, :integer, default: 1
  end
end
