class Hand < ActiveRecord::Base
	validates :score1, :score2, :score3, :score4, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 13}
end
