class UsersController < ApplicationController
  before_action :authenticate, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.nickname = params[:nickname]
    @user.content = params[:content]
    if @user.save
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to("/users/#{@user.id}")
    else
      flash[:notice] = "プロフィールを更新出来ませんでした。"
      render("users/edit")
    end
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    if @user.id != @current_user.id
      flash[:notice] = "編集権限がありません。"
      redirect_to("/users/index")
    end
  end
end
