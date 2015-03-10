class AddRejectedColumnToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :rejected, :boolean, default: false
  end
end
