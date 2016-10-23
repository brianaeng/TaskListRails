require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'a user must have a name' do
    assert users(:no_name).invalid?
    assert users(:ada).valid?
  end

  test 'a user must have a valid email' do
    assert users(:no_email).invalid?
    assert users(:incorrect_email).invalid?
    assert users(:babbage).valid?
  end

  test 'a user must have an avatar' do
    assert users(:no_avatar).invalid?
  end

  test 'a user must have a uid' do
    assert users(:no_uid).invalid?
  end

end
