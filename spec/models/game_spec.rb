require 'rails_helper'

RSpec.describe Game, :type => :model do
  it "is valid with players and without a nickname" do
  	game = create(:game)
  	expect(game).to be_valid
  end
end
