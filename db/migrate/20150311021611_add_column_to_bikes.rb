class AddColumnToBikes < ActiveRecord::Migration
  def change
  add_column :bikes, :user_id, :integer
  end
end
