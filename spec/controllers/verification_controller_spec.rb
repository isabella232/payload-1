require 'rails_helper'

RSpec.describe VerificationController, type: :controller do

  describe "GET #personal" do
    it "returns http success" do
      get :personal
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #business" do
    it "returns http success" do
      get :business
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #banking" do
    it "returns http success" do
      get :banking
      expect(response).to have_http_status(:success)
    end
  end

end
