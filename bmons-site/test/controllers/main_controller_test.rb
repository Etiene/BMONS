require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
  	sign_in users(:one)
    get :index
    assert_response :success
  end

end
