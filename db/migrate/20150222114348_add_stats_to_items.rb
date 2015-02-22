class AddStatsToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :description, :text
    add_column :items, :price, :integer
    add_column :items, :damage, :float
    add_column :items, :defense, :float
    add_column :items, :type, :string
  end
end
