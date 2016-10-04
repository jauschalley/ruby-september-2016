require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #log_in" do
    it "returns http success" do
      get :log_in
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #log_out" do
    it "returns http success" do
      get :log_out
      expect(response).to have_http_status(:success)
    end
  end

end
