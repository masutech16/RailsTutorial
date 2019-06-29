class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.star(micropost)
    @favorite = Favorite.find_by(micropost_id: micropost.id, user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @micropost = Favorite.find(params[:id]).micropost
    current_user.unstar(@micropost)
    respond_to do |format|
      format.js
    end
  end
end
