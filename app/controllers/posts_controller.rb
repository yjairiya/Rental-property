class PostsController < ApplicationController
  # post.image.attach(params[:post][:image])
  before_action :find_post, only: [:show, :edit, :update, :destroy, :approve_post, :reject_post, :send_mail, :response_mail]

  def index
    # debugger
    @posts = Post.approved.order(created_at: :asc)
    # @image = Post.all.with_attached_imeges
    #@mypost = current_user.posts.all.order(created_at: :desc)
  end

  def show
    # @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      # puts @post.errors
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

  def status
    @mypost = current_user.posts.all.order(created_at: :desc)
  end

  def approve_post
    @post.update!(status: 1)
    
  end

  def reject_post
    @post.update!(status: 2)
  end

  def send_mail
    PostMailer.with(user: current_user, post: @post).contact_request_email.deliver
    flash[:success] = "Thank you for your your Request! We'll get contact you soon!"
    redirect_to letter_opener_web_path
  end
  
  def response_mail
    PostMailer.with(user: current_user, post: @post).response_to_user_email.deliver
    flash[:success] = "Thank you for your your Request! We'll get contact you soon!"
    redirect_to letter_opener_web_path
  end
 
  
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:property_status, :owner_name, :location, :size, :price, :description, :phone, :email, images: [], status: )
  end
end
