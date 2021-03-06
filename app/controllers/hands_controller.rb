class HandsController < ApplicationController
	before_action :set_hand, only: [:show, :edit, :update, :destroy]
  before_action :set_game, only: [:create, :update, :edit, :destroy]

	def show
	end

	def new
		@hand = Hand.new
	end

	def create
		@hand = Hand.new(hand_params)
		@hand.game_id = @game.id
		@hand.update_score
		if @hand.save
			redirect_to @game, notice: "Hand was successfully added"
		else
			redirect_to @game, alert: "Failed to update. Make sure the hand score is between 0-13"
		end
	end

	def edit
	end

	def update
    if @hand.update(hand_params)
    	redirect_to game_path(@game), notice: "Hand successfully changed"
    else
    	redirect_to edit_game_hand_path(@game, @hand), alert: "Incorrect field submission"
    end
	end

	def destroy
		if @hand.destroy
			redirect_to @game, notice: "Hand was successfully deleted"
		else
			redirect_to edit_game_hand_path(@game, @hand), alert: "Hand failed to delete"
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
		params.require(:hand).permit(:score1, :score2, :score3, :score4, :game_id)
	end
end
