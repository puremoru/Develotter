class StarsController < ApplicationController
  before_action :authenticate
  def create
    @star = Star.new(user_id: current_user.id, post_id: params[:post_id])
    @star.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def destroy
    @star = Star.find_by(user_id: current_user.id, post_id: params[:post_id])
    @star.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end
