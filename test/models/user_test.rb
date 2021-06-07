require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user with encrypted password" do
    user = User.create(username: 'Testname', password: 'testpassword')
    
    assert user.password_digest != user.password
  end
end
