class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.integer :resource_id
      t.string :type
      t.string :description

      t.timestamps null: false
    end
  end
end
