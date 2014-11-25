class Game < ActiveRecord::Base
	validates :player1, presence: true

	def self.sort_by_recent
		order("id DESC")
	end

	def query_hands
		Hand.where(game_id: self.id).order("id ASC")
	end
end
