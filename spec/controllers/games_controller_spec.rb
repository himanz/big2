require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
  describe 'Get #index' do
  	it "populates an array with all the games" do
  		game1 = create(:game)
  		game2 = create(:game2)
  		get :index
  		expect(assigns(:games)).to match_array([game1, game2])
  	end

  	it "renders the :index view" do
  		get :index
  		expect(response).to render_template :index
  	end
  end
end
