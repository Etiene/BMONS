require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
    @user = User.new(name: "Example User", login: "test", access_level: "5", tel: "123456", email: "user@example.com", password: "fooooobar", password_confirmation: "fooooobar")
    end

  #test "password should have a minimum length" do
  #  @user.password = @user.password_confirmation = "a" * 5
  #  assert_not @user.valid?
  #end

end
