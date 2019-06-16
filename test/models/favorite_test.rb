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
    ants = microposts(:ants)
    assert_not michael.star?(ants)
    michael.star(ants)
    assert michael.star?(ants)
    michael.unstar(ants)
    assert_not michael.star?(ants)
  end
end
