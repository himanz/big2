require 'rails_helper'

RSpec.describe Game, :type => :model do
  it "is valid with players and without a nickname" do
  	game = create(:game)
  	expect(game).to be_valid
  end

  it "is valid without a nickname" do
  	game = Game.new(nickname: nil, players: 4)
  	expect(game.valid?).to be_truthy
  end

  it "is invalid without players" do
  	game = Game.new(players: nil)
  	expect(game.valid?).to be_falsey
  	expect(game.errors[:players].size).to eq(1)
  end

end
