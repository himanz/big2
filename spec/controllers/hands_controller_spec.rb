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

  describe 'GET #new' do
  	before do
  		@game = create(:game)
  		get :new, game_id: @game
  	end

  	it "assigns a new hand to @hand" do
  		expect(assigns(:hand)).to be_a_new(Hand)
  	end

  	it "renders the :new template" do
  		expect(response).to render_template :new
  	end
  end

  describe "POST #create" do
  	before do
  		@game = create(:game)
  	end

  	context "with valid attributes" do
  		it "saves the new hand in the database" do
	      expect{
	      	post :create, game_id: @game, hand: attributes_for(:hand)
	      }.to change(Hand, :count).by(1)
	    end

	    it "redirects to game#show" do
	    	post :create, game_id: @game, hand: attributes_for(:hand)
	    	expect(response).to redirect_to @game
	    end
  	end

  	context "with invalid attributes" do
  		it "does not save the new hand in the database" do
  			expect{
    			post :create, game_id: @game, hand: attributes_for(:hand_invalid)
        }.to_not change(Hand, :count) 
  		end

  		it "re-renders the :new template" do
  			post :create, game_id: @game, hand: attributes_for(:hand_invalid)
  			expect(response).to render_template :new
  		end
  	end
  end
end
