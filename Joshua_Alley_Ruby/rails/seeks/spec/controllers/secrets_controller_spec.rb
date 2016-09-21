require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create_user
    @secret = @user.secrets.create(content: "secret")
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
      get :index
      expect(response).to redirect_to('/sessions/new')
    end
    it "cannot access create" do
      post :create
      expect(response).to redirect_to('/sessions/new')
    end
    it "cannot access destroy" do
      delete :destroy, id: @secret
      expect(response).to redirect_to('/sessions/new')
    end
  end
end

