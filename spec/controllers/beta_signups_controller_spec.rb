require "spec_helper"

describe BetaSignupsController do
  include Devise::TestHelpers

  describe "POST #create" do
    let(:user) { create(:user) }
    before { sign_in user }

    it "is successful" do
      post :create, format: :json
      expect(response).to be_success
    end

    it "saves a new beta_signup to the database" do
      expect do
        post :create, format: :json
      end.to change(BetaSignup, :count).by(1)
    end
  end
end
