class AdminsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def roles
    @roles = User.all.order(created_at: :asc)
  end
end
