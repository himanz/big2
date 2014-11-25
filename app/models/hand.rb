class Hand < ActiveRecord::Base
	validates :score1, :score2, :score3, :score4, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 65}
	belongs_to :game

	def update_score
		self.score1 = score_multiplier(self.score1)
		self.score2 = score_multiplier(self.score2)
		self.score3 = score_multiplier(self.score3)
		self.score4 = score_multiplier(self.score4)
	end

	def score_multiplier(score)
		if score == nil
			0
		elsif score == 13
			score * 5
		elsif score >= 11
			score * 4
		elsif score >= 8
			score * 3
		elsif score >= 5
			score * 2
		else
			score
		end
	end
end
