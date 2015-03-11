class AddColumnToSocials < ActiveRecord::Migration
  def change
    add_column :socials, :user_id, :integer
  end
end
