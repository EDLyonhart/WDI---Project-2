class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :resource_id
      t.string :make
      t.string :model
      t.integer :year
      t.string :description

      t.timestamps null: false
    end
  end
end
