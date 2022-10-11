require 'rails_helper'

RSpec.describe Post, :type => :model do
  describe "When create and Update Post  " do
    context "When create One Post " do
      let!(:subject) {
        user = User.create(email: "test@gmail.com", first_name: "test_user", last_name: "test", phone: "898989898", password: "123123")
        Post.create(property_status: "Test", owner_name: "Test_owner", location: "test-Indore", size: "500", price: "5500", description: "This is best property", phone: "898989898", email: "test@gmail.com", user_id: user.id )
      }

      context "When Check Validation & Associations " do
        context "Associations" do
          it { should belong_to(:user) }
        end    
        
        it "is valid with valid attributes" do
          expect(subject).to be_valid
        end
        
        it "is not valid without a property_status" do
          subject.property_status = nil
          expect(subject).to_not be_valid
        end
    
        it "is not valid without a owner_name" do
          subject.owner_name = nil
          expect(subject).to_not be_valid
        end
    
        it "is not valid without a location" do
          subject.location = nil
          expect(subject).to_not be_valid
        end
    
        it "is not valid without a size" do
          subject.size = nil
          expect(subject).to_not be_valid
        end
    
        it "is not valid without a price" do
          subject.price = nil
          expect(subject).to_not be_valid
        end
       
        it "is not valid without a description" do
          subject.description = nil
          expect(subject).to_not be_valid
        end
    
        it "is not valid without a phone" do
          subject.phone = nil
          expect(subject).to_not be_valid
        end
        it "is not valid without a email" do
          subject.email = nil
          expect(subject).to_not be_valid
        end  
      end   
    end
  end

  describe "When post update " do
    let!(:post) {
      user = User.create(email: "test@gmail.com", first_name: "test_user", last_name: "test", phone: "898989898", password: "123123")
      Post.create(property_status: "Test1", owner_name: "Test_owner1", location: "test-Indore", size: "500", price: "5500", description: "This is best property", phone: "898989898", email: "test@gmail.com", user_id: user.id ) 
    }
  
    it "Post Update" do
      post.update(property_status: "xyz", phone: "1212121212")
      expect(post.property_status).to eql "xyz"
      expect(post.phone).to eql "1212121212"
    end
  end

  describe "when User Delete Post " do 
    let!(:post) {
            user = User.create(email: "test@gmail.com", first_name: "test_user", last_name: "test", phone: "898989898", password: "123123", role: "user")
            Post.create(property_status: "Test1", owner_name: "Test_owner1", location: "test-Indore", size: "500", price: "5500", description: "This is best property", phone: "898989898", email: "test@gmail.com", user_id: user.id ) 
    }
    it "when User Delete Post" do
      post.destroy
      expect {post.destroy}.to change{ Post.count }.by(0)
    end
  end
end
