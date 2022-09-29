class PostsController < ApplicationController
  # post.image.attach(params[:post][:image])
  def index
    @posts = Post.all
    # @image = Post.all.with_attached_imeges
  end

  def show
    @post =Post.find(params[:id])
  end

  def new
    @post =Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user 

    if @post.save
      redirect_to @post 
    else
      # puts @post.errors   
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.user = current_user 
    if @post.update(post_params)
    redirect_to post_path
    else
      render :edit
    end
  end

 
  def destroy
      @post = Post.find(params[:id])
      @post.user = current_user
      if @post.destroy
        redirect_to post_path
      end
  end
  private 
  def post_params
     params.require(:post).permit(:property_status, :owner_name, :location, :size, :price,:description, :phone, :email, :image)
  end
end
