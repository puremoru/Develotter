class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(name: params[:name],
                      url: params[:url],
                    theme: params[:theme],
                    about: params[:about],
                 strength: params[:strength])
    if @post.save
      redirect_to("/")
    end
  end
end
