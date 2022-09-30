class AdminsController < ApplicationController
  def index
    @admins = User.all.order(created_at: :asc)
    @posts = Post.all.order(created_at: :asc)
  end
end
