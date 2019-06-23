class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.star(micropost)
    # TODO: どこに飛ばすべきかを考える
  end

  def destroy
    micropost = Favorite.find(params[:id]).followed
    current_user.unstar(micropost)
    # TODO: どこに飛ばすべきかを考える
  end
end
