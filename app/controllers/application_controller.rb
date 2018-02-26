class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :current_user, :current_post

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    flash[:notice] = "ログインしてください"
    redirect_to root_path
  end

  def current_post
    return Post.find_by(id: params[:id])
  end
end
