class PostsController < ApplicationController
  # post.image.attach(params[:post][:image])
  before_action :find_post, only: [:show, :edit, :update, :destroy, :approve_post, :reject_post]

  def index
    @posts = Post.approved.order(created_at: :asc)
    # @image = Post.all.with_attached_imeges
    @mypost = current_user.posts.all
  end

  def show
    @post = Post.find(params[:id])
    # @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    # @post = user.status = "false" 
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @post.user = current_user
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post.user = current_user
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  def post_approved
    @post = Post.find(params[:id])
    @post.status = "approved"
    if @post.update
      redirect_to @post      
    end
  end
  def post_rejected
    @post = Post.find(params[:id])
    @post.status = "rejected"
    if @post.update
      redirect_to @post      
    end
  end

  def approve_post
    @post.update!(status: 1)
  end

  def reject_post
    @post.update!(status: 2)
  end
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:property_status, :owner_name, :location, :size, :price, :description, :phone, :email, images: [],status: )
  end
end
# bin/rails g model AddImagesToPost images:attachments status:string
