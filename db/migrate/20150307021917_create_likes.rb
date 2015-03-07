class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :liker
      t.integer :likee
      t.boolean :is_matched

      t.timestamps null: false
    end
  end
end
