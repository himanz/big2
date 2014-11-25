require 'rails_helper'

RSpec.describe Hand, :type => :model do
  it "is valid with a score1, score2, score3, score4" do
  	hand = create(:hand)
  	expect(hand).to be_valid
  end

  it "is invalid if score1 is under 0" do
  	hand = Hand.new(score1: -1, score2: 13, score3: 0, score4: 1)
    expect(hand.valid?).to be_falsey
    expect(hand.errors[:score1].size).to eq(1)  	
  end

  it "is invalid if score1 is over 13 " do
  	hand = Hand.new(score1: 14, score2: 13, score3: 0, score4: 1)
    expect(hand.valid?).to be_falsey
    expect(hand.errors[:score1].size).to eq(1)
  end

  it "is invalid if score1 is a string" do
  	hand = Hand.new(score1: "hello", score2: 13, score3: 0, score4: 1)
    expect(hand.valid?).to be_falsey
    expect(hand.errors[:score1].size).to eq(1)
  end
end
