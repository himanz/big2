require 'rails_helper'

RSpec.describe Hand, :type => :model do
  it "is valid with a score1, score2, score3, score4" do
  	hand = create(:hand)
  	expect(hand).to be_valid
  end

  it "is invalid if score1 is under 0" do
  	hand = Hand.create(score1: -1, score2: 13, score3: 0, score4: 1)
    expect(hand.valid?).to be_falsey
    expect(hand.errors[:score1].size).to eq(1)  	
  end

  it "is invalid if score1 is over 65 " do
  	hand = Hand.create(score1: 66, score2: 13, score3: 0, score4: 1)
    expect(hand.valid?).to be_falsey
    expect(hand.errors[:score1].size).to eq(1)
  end

  it "is invalid if score1 is a string" do
  	hand = Hand.new(score1: "hello", score2: 13, score3: 0, score4: 1)
    expect(hand.valid?).to be_falsey
    expect(hand.errors[:score1].size).to eq(1)
  end

  it "score multiplier should return 65 on 13" do
    hand = create(:hand)
    score = hand.score_multiplier(13)
    expect(score).to eq(65)
  end

  it "score multiplier should return 48 on 12" do
    hand = create(:hand)
    score = hand.score_multiplier(12)
    expect(score).to eq(48)
  end

  it "score multiplier should return 30 on 10" do
    hand = create(:hand)
    score = hand.score_multiplier(10)
    expect(score).to eq(30)
  end

  it "score multiplier should return 12 on 6" do
    hand = create(:hand)
    score = hand.score_multiplier(6)
    expect(score).to eq(12)
  end

  it "score multiplier should return 2 on 2" do
    hand = create(:hand)
    score = hand.score_multiplier(2)
    expect(score).to eq(2)
  end

  it "score multiplier should return 0 on nil" do
    hand = create(:hand)
    score = hand.score_multiplier(nil)
    expect(score).to eq(0)
  end
end
