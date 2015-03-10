class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :resource_id
      t.string :make
      t.string :model
      t.integer :year
      t.string :description

      t.timestamps null: false
    end
  end
end
