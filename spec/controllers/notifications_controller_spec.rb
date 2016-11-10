require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do

  describe "GET #coinbase" do
    it "returns http success" do
      get :coinbase
      expect(response).to have_http_status(:success)
    end
  end

end
