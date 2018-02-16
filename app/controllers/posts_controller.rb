class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
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
      flash[:notice] = "サービスを投稿しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "サービス名と説明は必須入力です。説明は200字以内の制限があります。"
      render("posts/new")
    end
  end
end
