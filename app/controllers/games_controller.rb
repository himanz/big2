class GamesController < ApplicationController
	before_action :set_game, only: [:show]

	def index
		@games = Game.all.sort_by_recent
	end

	def show
		@hands = @game.query_hands
		@hand = Hand.new
		@owe_array = @game.calculate_owe
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		@game.check_no_player_name
		if @game.save
			redirect_to @game, notice: "Game was successfully created"
		else
			render :new, alert: "Check yo fields"
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
