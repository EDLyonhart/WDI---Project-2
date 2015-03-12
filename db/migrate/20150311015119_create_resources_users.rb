class CreateResourcesUsers < ActiveRecord::Migration
  def change
    create_table :resources_users do |t|
      t.integer :user_id
      t.string :resource_category
      t.integer :has_user_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
