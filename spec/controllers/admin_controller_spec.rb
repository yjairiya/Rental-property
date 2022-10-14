require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
  let(:signed_in_user) { User.create(email: "admin@gmail.com", first_name: "test_user", last_name: "test", phone: "898989898", password: "123123", role: "admin")}
  
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(signed_in_user)
    allow(controller).to receive(:authenticate_user!).and_return(signed_in_user)
  end

  describe "GET #index" do
    it "When renders the :admin/Index" do  
      get :index
      expect(response).to render_template("index")
    end
    it "When Seen All Roles :admin/roles" do  
      get :roles
      expect(response).to render_template("roles")
    end
  end
end




