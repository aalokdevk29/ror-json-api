require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "checking index action" do
      get '/api/v1/users'
      expect(response).to have_http_status(:ok)
    end

    let(:user) { create(:user) }
    it "should not return is_admin" do
      get '/api/v1/users'
      expect(user.is_admin.present?).to be false
    end
  end
end