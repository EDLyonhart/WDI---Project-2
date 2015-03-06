class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :nickname
      t.string :email
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :profile_pic
      t.string :location
      t.string :gender

      t.timestamps null: false
    end
  end
end
