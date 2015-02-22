class AddImagePathToItems < ActiveRecord::Migration
  def change
    add_column :cosmetic_items, :image_path, :string
    add_column :items, :image_path, :string
  end
end
