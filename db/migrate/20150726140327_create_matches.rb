class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.time :turn_start_time, :default => Time.now
      t.time :turn_final_time, :default => Time.now
      t.integer :winner_id

      t.timestamps null: false
    end
  end
end
