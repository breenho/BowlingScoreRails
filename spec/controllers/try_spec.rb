require 'rails_helper'

RSpec.describe TriesController, type: :controller do
	describe "GET index" do
    it "assigns @each_frames_score" do
      get :index
      p assigns
      expect(assigns).to eq({"each_frames_score"=>[], "result"=>nil})      
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end