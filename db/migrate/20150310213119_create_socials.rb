class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.integer :resource_id
      t.string :interests, array:true, default: []
      t.string :description

      t.timestamps null: false
    end
  end
end
