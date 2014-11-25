FactoryGirl.define do
  factory :hand do
    score1 7
		score2 0
		score3 13
		score4 5
		game_id 1

		factory :hand2 do
			score1 11
			score2 3
			score3 5
			score4 0
		end

		factory :hand_for_game2 do
			game_id 2
		end

		factory :hand_invalid do
			score1 14
		end
  end

end
