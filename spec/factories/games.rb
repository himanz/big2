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
  end

end
