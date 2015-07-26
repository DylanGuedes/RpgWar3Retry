class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :starter_id
      t.integer :target_id
      t.integer :winner_id
      t.integer :loser_id
      t.boolean :draw
      t.text :battle_log, :default => ""
      t.belongs_to :match

      t.timestamps null: false
    end
  end
end
