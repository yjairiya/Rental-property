require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:signed_in_user) { FactoryBot.create(:user)}
  before  do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(signed_in_user)
    allow(controller).to receive(:authenticate_user!).and_return(signed_in_user)
  end

  describe "GET #index" do
    it "When assigns @posts" do
      all_posts = Post.approved.order(created_at: :asc)
      get :index
      expect(assigns(:posts)).to eq(all_posts)
    end

    it "When renders the :Index" do  
      get :index
      expect(response).to render_template("index")
    end
  end
  
  describe "GET #new" do
    it "When assigns new Action" do
      get :new
      expect(assigns(:post)).to be_instance_of(Post)
    end

    it "When renders the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    context " success" do
      it " When Create new Post to current_user" do
        posts_count = signed_in_user.posts.count
        # new_post = signed_in_user
        # post :create, params: {post: (new_post)}
        # let(:new_post) { Factory.new(:post)}
        post :create, params: {post: {property_status: "Test1", owner_name: "Test_owner1", location: "test-Indore", size: "500", price: "5500", 
                                        description: "This is best property", phone: "898989898", email: "test@gmail.com", user_id: signed_in_user}}
                                        expect(response).to redirect_to( root_path )
        expect(signed_in_user.posts.count).to eq(posts_count + 1)
      end

      it " When Create Post but post not created " do
        posts_count = signed_in_user.posts.count
        post :create, params: {post: {property_status: "", owner_name: "Test_owner1", location: "test-Indore", size: "500", price: "5500", 
                                        description: "This is best property", phone: "898989898", email: "", user_id: signed_in_user}} 
        expect(response).to render_template( "new" )
        expect(signed_in_user.posts.count).to eq(posts_count + 0)
      end
    end
  end

  describe "GET Method" do 
    context "Show #post" do
      it " When  Post seen Succesfully Open " do
        posts_count = signed_in_user.posts.count
        post :create, params: {post: {property_status: "Test1Show", owner_name: "Test_owner1", location: "test-Indore", size: "500", price: "5500", 
                                        description: "This is best property", phone: "898989898", email: "Test1Show", user_id: signed_in_user}} 

        get :show, params: { id: 2 }
        # get :new, Post.find(params[:id])
        expect(response).to render_template("posts/show")
        # get show, params: {post: {id: signed_in_user.p} }
        # expect(signed_in_user.posts).to eq()
      end
    end
  end
end

