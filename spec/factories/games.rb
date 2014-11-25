FactoryGirl.define do
  factory :game do
    nickname "MyString"
    player1 "Jonos"
    player2 "Peter"
    player3 "Pigpig"
    player4 "Julio"

    factory :game2 do
    	nickname "Game Second"
    	player1 "Bobby"
    end

    factory :game_with_hands do
    	after(:create) do |game|
    		create(:hand, score1: 5, game_id: game.id)
        create(:hand, score1: 10, game_id: game.id)
    	end
    end
  end

end
