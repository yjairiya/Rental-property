class AdminsController < ApplicationController
  def index
    @admins = User.all.order(created_at: :asc)
    @posts = Post.all.order(created_at: :asc)
    @mypost = current_user.posts.all
  end
  def verify
    @posts = Post.all.order(created_at: :asc)
  end
  
end
