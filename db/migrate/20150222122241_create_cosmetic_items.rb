class CreateCosmeticItems < ActiveRecord::Migration
  def change
    create_table :cosmetic_items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.float :damage
      t.float :defense
      t.string :type

      t.timestamps null: false
    end
  end
end
