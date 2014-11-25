class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :nickname
      t.string :player1, :default => "Player 1"
      t.string :player2, :default => "Player 2"
      t.string :player3, :default => "Player 3"
      t.string :player4, :default => "Player 4"

      t.timestamps
    end
  end
end
