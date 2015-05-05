require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:two)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    #assert_not_nil assigns(:users)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create user" do
    #sign_in users(:one)
    #assert_difference('User.count') do
    #  post :create, user: {  access_level: 0, email: 'a@a.com', name: @user.name, tel: @user.tel, password: 'afadfa', password_confirmation: 'afadfa' }
      #post :create, user: { email: 'a@a.com', name: @user.name, tel: @user.tel, encrypted_password: 'afadfa'}
      #post :create, user: { access_level: @user.access_level, email: 'a@a.com', name: @user.name, tel: @user.tel, password: 'afadfa', password_confirmation:'afadfa' }
      #post :create, user: { access_level: 0, email:'a@a.com', name: 'sss', tel: '123456', encrypted_password: 'sdfsdfs' }
    #end
    #assert_redirected_to user_path(assigns(:user))
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
    patch :update, id: @user, user: { access_level: @user.access_level, email: @user.email, name: @user.name, tel: @user.tel, encrypted_password: @user.encrypted_password }
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
