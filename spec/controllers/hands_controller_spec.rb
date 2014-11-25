require 'rails_helper'

RSpec.describe HandsController, :type => :controller do
  describe "Get #show" do

  	it "assigns the requested hand to @hand" do
  		@game = create(:game)
  		@hand = create(:hand, game_id: @game)
  		get :show, id: @hand, game_id: @game.id
  		expect(assigns(:hand)).to eq @hand
  	end
  end
end
