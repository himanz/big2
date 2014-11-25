class HandsController < ApplicationController
	before_action :set_hand, only: [:show, :edit, :update]
  before_action :set_game, only: [:create, :update, :edit]

	def show
	end

	def new
		@hand = Hand.new
	end

	def create
		@hand = Hand.new(hand_params)
		@hand.game_id = @game.id
		@hand.check_no_score
		if @hand.save
			redirect_to @game
		else
			render :new
		end
	end

	def edit
	end

	def update
    if @hand.update(hand_params)
    	redirect_to game_path(@game)
    else
    	render :edit
    end
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
