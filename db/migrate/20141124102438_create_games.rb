class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :nickname
      t.string :player1
      t.string :player2
      t.string :player3
      t.string :player4

      t.timestamps
    end
  end
end
