class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :uid
      t.boolean :is_user

      t.timestamps null: false
    end
  end
end
