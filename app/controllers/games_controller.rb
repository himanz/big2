class GamesController < ApplicationController
	before_action :set_game, only: [:show]

	def index
		@games = Game.all.sort_by_recent
	end

	def show
		@hands = @game.query_hands
		@hand = Hand.new
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		if @game.save
			redirect_to @game
		else
			render :new
		end
	end

	private
  def set_game
  	@game = Game.find(params[:id])
  end

  def game_params
  	params.require(:game).permit(:nickname, :player1, :player2, :player3, :player4)
  end
end
