class PostsController < ApplicationController
  before_action :authenticate, only: [:new, :create, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  include ScrapingImg

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = current_post
    @user = User.find_by(id: @post.user_id)
    @comments = Comment.where(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(name: params[:name],
                catchcopy: params[:catchcopy],
                      url: params[:url],
                    theme: params[:theme],
                    about: params[:about],
                 strength: params[:strength],
                    stroy: params[:stroy],
                  user_id: @current_user.id)

    # if params[:image]
    #   @post.img_name = "#{@post.name}.jpg"
    #   image = params[:image]
    #   File.binwrite("public/post_images/#{@post.img_name}", image.read)
    # end

    if params[:url]
      tmp = scrape_img(params[:url])
      if File.extname(tmp) =~ /.*\.png/i || File.extname(tmp) =~ /.*\.jpg/i  || File.extname(tmp) =~ /.*\.jpeg/i
        @post.img_url = tmp
      end
    end

    if @post.save
      flash[:notice] = "サービスを投稿しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "サービス名と説明は必須入力です。説明は200字以内の制限があります。"
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name]
    @post.catchcopy = params[:catchcopy]
    @post.url = params[:url]
    @post.theme = params[:theme]
    @post.about = params[:about]
    @post.strength = params[:strength]
    @post.stroy = params[:stroy]

    if params[:url]
      tmp = scrape_img(params[:url])
      if File.extname(tmp) =~ /.*\.png/i || File.extname(tmp) =~ /.*\.jpg/i  || File.extname(tmp) =~ /.*\.jpeg/i
        @post.img_url = tmp
      end
    end

    if @post.save
      flash[:notice] = "投稿を編集しました。"
      redirect_to("/posts/#{@post.id}")
    else
      flash[:notice] = "投稿の編集に失敗しました。"
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to("/posts/index")
    end
  end

  def trend
    @posts = Post.all
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != current_user.id
      flash[:notice] = "他のユーザーの投稿は編集できません。"
      redirect_to("/posts/index")
    end
  end
end
