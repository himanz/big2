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

end