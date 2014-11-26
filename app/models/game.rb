class Game < ActiveRecord::Base
	validates :player1, presence: true
	has_many :hands

	def self.sort_by_recent
		order("id DESC")
	end

	def query_hands
		Hand.where(game_id: self.id).order("id ASC")
	end

	def total_score(player)
    if player == 1
    	query_hands.sum(:score1)
    elsif player == 2
    	query_hands.sum(:score2)
    elsif player == 3
    	query_hands.sum(:score3)
    elsif player == 4
    	query_hands.sum(:score4)
    end
	end

	def total_score_all_players
		score_array = []
		for i in 1..4
			score_array.push(total_score(i))
		end
		score_array
	end

	def check_no_player_name
		if player1 == ""
			self.player1 = "Player 1"
		end

		if player2 == ""
			self.player2 = "Player 2"
		end

		if player3 == ""
			self.player3 = "Player 3"
		end

		if player4 == ""
			self.player4 = "Player 4"
		end
	end

	def calculate_owe
		score_array = total_score_all_players
		final_owe = []
		for i in 0..score_array.length-1
			current_player_owe = []
			current_player_score = score_array[i]
      for j in 0..score_array.length-1
        if j == i
          current_player_owe.push(0)
        else
        	if current_player_score > score_array[j]
        		current_player_owe.push(current_player_score - score_array[j])
        	else
        	  current_player_owe.push(0) 
        	end
        end 
      end
      final_owe.push(current_player_owe)
		end
		final_owe
	end
end
