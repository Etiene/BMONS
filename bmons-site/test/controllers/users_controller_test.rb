require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create user" do
    sign_in users(:one)
    assert_difference('User.count') do
      post :create, user: { access_level: @user.access_level,access_level: @user.access_level, email: @user.email, login: @user.login, name: @user.name, password_digest: @user.password_digest, tel: @user.tel }
    end
    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    sign_in users(:one)
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    sign_in users(:one)
    patch :update, id: @user, user: { access_level: @user.access_level, email: @user.email, login: @user.login, name: @user.name, password_digest: @user.password_digest, tel: @user.tel }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    sign_in users(:one)
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
