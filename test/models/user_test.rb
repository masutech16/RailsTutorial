require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ' '
    assert @user.invalid?
  end

  test 'email should be present' do
    @user.name = ' '
    assert @user.invalid?
  end

  test 'name should not be too long than 50 characters' do
    @user.name = 'a' * 51
    assert @user.invalid?

    @user.name = 'a' * 50
    assert @user.valid?
  end

  test 'email should not be too long than 255 characters' do
    @user.email = 'a' * 244 + '@example.com'
    assert @user.invalid?

    @user.email = 'a' * 243 + '@example.com'
    assert @user.valid?
  end
end
