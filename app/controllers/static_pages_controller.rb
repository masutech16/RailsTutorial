class StaticPagesController < ApplicationController

  def home
    return if !logged_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    @favorites = current_user.favorites.where(micropost_id: @feed_items)
  end

  def help
  end

  def about
  end

  def contact
  end
end
