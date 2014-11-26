FactoryGirl.define do
  factory :game do
    nickname "MyString"
    player1 "Jonos"
    player2 "Peter"
    player3 "Pigpig"
    player4 "Julio"
    amount "0.5"

    factory :game2 do
    	nickname "Game Second"
    	player1 "Bobby"
    end

    factory :game_with_hands do
    	after(:create) do |game|
    		create(:hand, score1: 5, score2: 5, score3: 10, score4: 0, game_id: game.id)
        create(:hand, score1: 10, score2: 0, score3: 1, score4: 13, game_id: game.id)
    	end
    end
  end

end
