class AddCosmeticTypeToCosmeticItems < ActiveRecord::Migration
  def change
    add_column :cosmetic_items, :cosmetic_type, :string
  end
end
