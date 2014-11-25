class HandsController < ApplicationController
	before_action :set_hand, only: [:show, :edit]
  before_action :set_game, only: [:create]

	def show
	end

	def new
		@hand = Hand.new
	end

	def create
		@hand = Hand.new(hand_params)
		@hand.game_id = @game.id
		if @hand.save
			redirect_to @game
		else
			render :new
		end
	end

	def edit
	end

	private

	def set_game
		@game = Game.find(params[:game_id])
	end

	def set_hand
		@hand = Hand.find(params[:id])
	end

	def hand_params
		params.require(:hand).permit(:score1, :score2, :score3, :score4)
	end
end
