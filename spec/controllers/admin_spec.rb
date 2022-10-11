require "rails_helper"
RSpec.describe AdminsController, type: :request do
  describe "GET index" do
    it "renders the index template" do
      get '/admins/index'
      expect(response).to redirect_to( new_user_session_path )
    end
  end
  describe "GET index" do
    it "renders the index template" do
      get '/roles'
      expect(response).to redirect_to( new_user_session_path )
    end
  end
end



