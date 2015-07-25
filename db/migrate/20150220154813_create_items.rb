class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.float :damage
      t.float :defense
      t.string :type
      t.belongs_to :player

      t.timestamps null: false
    end
  end
end