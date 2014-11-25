class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :score1, default: 0
      t.integer :score2, default: 0
      t.integer :score3, default: 0
      t.integer :score4, default: 0
      t.integer :game_id

      t.timestamps
    end
  end
end
