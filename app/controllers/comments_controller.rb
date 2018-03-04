class CommentsController < ApplicationController
  before_action :current_post
  before_action :authenticate
  before_action :ensure_correct_user, only: [:destroy]
  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(content: params[:content],
                            user_id: current_user.id,
                            post_id: @post.id)
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to "/posts/#{@post.id}"
    else
      flash[:notice] = "コメントを投稿できませんでした。"
      render("posts/show")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_to("/posts/#{@post.id}")
    end
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    @comment = Comment.find_by(id: params[:id])
    if @comment.user_id != current_user.id
      flash[:notice] = "他のユーザーのコメントは削除できません。"
      redirect_to("/posts/#{@post.id}")
    end
  end
end
