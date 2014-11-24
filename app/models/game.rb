class Game < ActiveRecord::Base
	validates :players, presence: true
end
