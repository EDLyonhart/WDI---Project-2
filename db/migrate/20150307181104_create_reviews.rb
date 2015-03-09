class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewable_id
      t.string :reviewable_type
      t.string :content
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
