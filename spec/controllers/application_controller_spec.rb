require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let(:signed_in_user) { User.create(email: "admin@gmail.com", first_name: "test_data", last_name: "data", phone: "898989856", password: "123123", role: "user")}
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(signed_in_user)
    allow(controller).to receive(:authenticate_user!).and_return(signed_in_user)
  end

  describe "When User sign_up " do
    it "after_sign_up_path_for " do 
        controller.after_sign_up_path_for(signed_in_user).should == new_user_session_path
        expect(controller.after_sign_up_path_for(signed_in_user)).to eq(new_user_session_path)
    end
    
    it "after_update_path_for " do 
      # controller.after_update_path_for(signed_in_user).should == letter_opener_web_path
      expect(controller.after_update_path_for(signed_in_user)).to eq(root_path)
    end
  end

  describe "When User after_sign_in_path_for " do
    it "after sign in path for User " do 
      signed_in_user.role = "user"
        controller.after_sign_in_path_for(signed_in_user.role).should == root_path
        expect(controller.after_sign_in_path_for(signed_in_user.role)).to eq(root_path)
    end
    it "after sign in path for Owner " do 
      signed_in_user.role = "owner"
        controller.after_sign_in_path_for(signed_in_user.role).should == root_path
        expect(controller.after_sign_in_path_for(signed_in_user.role)).to eq(root_path)
    end
    it "after sign in path for Admin " do 
      signed_in_user.role = "admin"
        controller.after_sign_in_path_for(signed_in_user.role).should == admins_index_path
        expect(controller.after_sign_in_path_for(signed_in_user.role)).to eq(admins_index_path)
    end
  end
end
