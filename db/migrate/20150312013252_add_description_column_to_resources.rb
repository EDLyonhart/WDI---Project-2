class AddDescriptionColumnToResources < ActiveRecord::Migration
  def change
    add_column :resources, :description, :text, default: "No description given"
  end
end
