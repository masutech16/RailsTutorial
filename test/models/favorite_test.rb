require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  def setup
    @favorite = Favorite.new(user_id: users(:michael).id,
                  micropost_id: microposts(:ants).id)
  end

  test 'should be valid' do
    assert @favorite.valid?
  end

  test 'should require a user_id' do
    @favorite.user_id = nil
    assert_not @favorite.valid?
  end

  test 'should require a micropost_id' do
    @favorite.micropost_id = nil
    assert_not @favorite.valid?
  end

  test 'should star and unstar a micropost' do
    michael = users(:michael)
    tone = microposts(:tone)
    assert_not michael.star?(tone)
    michael.star(tone)
    assert michael.star?(tone)
    michael.unstar(tone)
    assert_not michael.star?(tone)
  end
end
