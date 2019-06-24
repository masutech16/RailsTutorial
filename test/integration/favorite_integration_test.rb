require 'test_helper'

class FavoriteIntegrationTest < ActionDispatch::IntegrationTest
    def setup
    @user = users(:michael)
    @micropost = microposts(:cat_video)
    log_in_as(@user)
  end

  test 'favorite page' do
    get favorites_user_path(@user)
    assert_not @user.favorites.empty?
    assert_match @user.favorites.count.to_s, response.body
    @user.favorites.each do |micropost|
      assert_select 'a[href=?]', user_path(micropost.user_id)
    end
  end

  test 'should star a micropost with Ajax' do
    assert_difference '@user.favorites.count', 1 do
      post favorites_path, xhr: true, params: { micropost_id: @micropost.id }
    end
  end

  test 'should unstar a micropost with Ajax' do
    @user.star(@micropost)
    favorite = @user.favorites.find_by(user_id: @user.id, micropost_id: @micropost.id)
    assert_difference '@user.favorites.count', -1 do
      delete favorite_path(favorite), xhr: true
    end
  end
end
