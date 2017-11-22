require 'rails_helper'

RSpec.describe TriesController, type: :controller do
	describe "GET index" do
    it "assigns @each_frames_score" do
      tries = []
      get :index
      expect(assigns(@each_frames_score)).to eq([])
      expect(assigns(@result)).to eq(nil)
      # expect(assigns(@each_frames_score)).to eq([])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end