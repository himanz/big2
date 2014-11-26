require 'rails_helper'

RSpec.describe Game, :type => :model do
  it "is valid with player1, player2, player3, player 4 and without a nickname" do
  	game = create(:game)
  	expect(game).to be_valid
  end

  it "is valid without a nickname" do
  	game = Game.new(nickname: nil, player1: "A", player2: "B", player3: "C", player4: "D")
  	expect(game.valid?).to be_truthy
  end

  it "is invalid without player1" do
  	game = Game.new(player1: nil)
  	expect(game.valid?).to be_falsey
  	expect(game.errors[:player1].size).to eq(1)
  end

  it "calculates total score" do
  	game = create(:game_with_hands)
  	expect(game.total_score(1)).to eq(15)
  end

  it "returns array of total score of all players" do
  	game = create(:game_with_hands)
  	score_array = game.total_score_all_players
  	expect(score_array).to eq([15, 5, 11, 13])
  end
end
