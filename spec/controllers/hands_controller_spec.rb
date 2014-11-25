require 'rails_helper'

RSpec.describe HandsController, :type => :controller do
  describe "Get #show" do
    before do
    	@game = create(:game)
  		@hand = create(:hand, game_id: @game)
  		get :show, id: @hand, game_id: @game.id
    end

  	it "assigns the requested hand to @hand" do
  		expect(assigns(:hand)).to eq @hand
  	end

  	it "renders the :show template" do
  		expect(response).to render_template :show
  	end
  end
end
