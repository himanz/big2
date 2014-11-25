class Game < ActiveRecord::Base
	validates :player1, presence: true

	def self.sort_by_recent
		order("id DESC")
	end
end
