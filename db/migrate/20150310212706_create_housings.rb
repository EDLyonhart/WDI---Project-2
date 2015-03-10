class CreateHousings < ActiveRecord::Migration
  def change
    create_table :housings do |t|
      t.integer :resource_id
      t.string :type
      t.integer :bedrooms
      t.string :bathrooms
      t.string :integer
      t.integer :sq_footage
      t.string :description

      t.timestamps null: false
    end
  end
end
