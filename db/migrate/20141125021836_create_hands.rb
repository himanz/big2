class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :score1
      t.integer :score2
      t.integer :score3
      t.integer :score4
      t.integer :game_id

      t.timestamps
    end
  end
end
