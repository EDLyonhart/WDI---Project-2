class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :user_id
      t.string :category
      t.boolean :presence
      

      t.timestamps null: false
    end
  end
end
