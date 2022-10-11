require "rails_helper"

RSpec.describe User, :type => :model do
    context "when user is created" do
      let!(:user) { User.create!(first_name: 'Swapnil', last_name: 'Gupta', email: 'swap@test.com', password: '12345656', phone: '9123456789') }
        it "should be valid with valid attributes" do
          expect(user).to be_valid
        end 
        it 'should not be valid without first_name' do
          user.first_name = nil
          expect(user).not_to be_valid
        end
          it 'should not be valid without last_name' do
          user.last_name = nil
          expect(user).not_to be_valid
        end
        it 'should not be valid without email' do
          user.email = nil
          expect(user).not_to be_valid
        end
        it 'should not be valid without phone' do
          user.phone = nil
          expect(user).not_to be_valid
        end
        it 'should not be valid without password' do
          user.password = nil
          expect(user).not_to be_valid
        end
        describe User do
          it "should have many posts" do
            t = User.reflect_on_association(:posts)
            expect(t.macro).to eq(:has_many)
          end
        end
        context 'when user is updated' do
        let!(:user)  { User.create!(first_name: 'Swapnil', last_name: 'Gupta', email: 'swap@test.com', password: '12345656', phone: '9123456789') }
          it 'updates user' do
            user.first_name = 'Swap'
            user.phone = '1234567890'
            user.save!
            expect(user.first_name).to eql "Swap"
            expect(user.phone).to eql '1234567890'
          end
      end
  end
      describe 'when user is deleted' do
        let!(:user)  { User.create!(first_name: 'Swapnil', last_name: 'Gupta', email: 'swap@test.com', password: '12345656', phone: '9123456789') }
        it 'destroy user' do
          user.destroy
          expect { user.destroy }.to change { User.count }.by(0)    
        end
      end
      describe 'when user role is owner' do
        let!(:owner) { User.create!(first_name: 'Swapnil', last_name: 'Gupta', email: 'swap@test.com', password: '12345656', phone: '9123456789', role: 'owner') }
        it 'user role must be owner' do
            expect(owner.role).to eql 'owner'
        end
    end
    describe 'when user role is user' do
      let!(:user) { User.create!(first_name: 'Swapnil', last_name: 'Gupta', email: 'swap@test.com', password: '12345656', phone: '9123456789', role: 'user') }
      it 'user role must be user' do
        expect(user.role).to eql 'user'
      end
    end
    describe 'when user role is admin' do
      let!(:admin) { User.create!(first_name: 'Swapnil', last_name: 'Gupta', email: 'swap@test.com', password: '12345656', phone: '9123456789', role: 'admin') }
      it 'user role must be admin' do
        expect(admin.role).to eql 'admin'
      end
    end
end   
