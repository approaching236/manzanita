require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_is_admin
    user = User.new(:access_level => 1000)
    assert user.is_admin?
  end
end
