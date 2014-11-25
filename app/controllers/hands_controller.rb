class HandsController < ApplicationController
	before_action :set_hand, only: [:show]

	def show
	end

	private

	def set_hand
		@hand = Hand.find(params[:id])
	end
end
