class AddExtraDefenseToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :extra_defense, :float, :default => 0
    add_column :players, :extra_damage, :float, :default => 0
  end
end
