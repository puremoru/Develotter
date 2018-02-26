class CommentsController < ApplicationController
  before_action :current_post
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
end
