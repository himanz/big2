require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
  describe 'Get #index' do
  	it "populates an array with all the games in descending order of id" do
  		game1 = create(:game)
  		game2 = create(:game2)
  		get :index
  		expect(assigns(:games)).to eq([game2, game1])
  	end

  	it "renders the :index view" do
  		get :index
  		expect(response).to render_template :index
  	end
  end

  describe 'GET #show' do
  	it "returns the requested game to @game" do
  		game = create(:game)
  		get :show, id: game
  		expect(assigns(:game)).to eq game
  	end

  	it "renders the show template" do
  		game = create(:game)
  		get :show, id: game
  		expect(response).to render_template :show
  	end
  end

  describe 'GET #new' do
  	it "assigns a new game to @game" do
  		get :new
  		expect(assigns(:game)).to be_a_new(Game)
  	end

  	it "renders the new template" do
  		get :new
  		expect(response).to render_template :new
  	end
  end

  describe 'POST #create' do
  	context "with valid attributes" do
  		it "saves the new game to the database" do
  			expect{
  				post :create, game: attributes_for(:game)
  			}.to change(Game, :count).by(1)
  		end

  		it "redirects to game #show" do
  			post :create, game: attributes_for(:game)
  			expect(response).to redirect_to game_path(assigns(:game))
  		end
  	end
  end
end
