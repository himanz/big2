class HandsController < ApplicationController
	before_action :set_hand, only: [:show]

	def show
	end

	def new
		@hand = Hand.new
	end

	private

	def set_hand
		@hand = Hand.find(params[:id])
	end
end
