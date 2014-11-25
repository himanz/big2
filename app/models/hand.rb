class Hand < ActiveRecord::Base
	validates :score1, :score2, :score3, :score4, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 13}

	def check_no_score
		if score1 == nil
			self.score1 = 0
		end

		if score2 == nil
			self.score2 = 0
		end

		if score3 == nil
			self.score3 = 0
		end

		if score4 == nil
			self.score4 = 0
		end
	end
end
