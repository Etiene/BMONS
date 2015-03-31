require 'test_helper'

class BeehivesControllerTest < ActionController::TestCase
  setup do
    @beehive = beehives(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:beehives)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create beehive" do
    sign_in users(:one)
    assert_difference('Beehive.count') do
      post :create, beehive: { mode: @beehive.mode, name: @beehive.name, position: @beehive.position, user_id: @beehive.user_id }
    end

    assert_redirected_to beehive_path(assigns(:beehive))
  end

  test "should show beehive" do
    sign_in users(:one)
    sign_in users(:one)
    get :show, id: @beehive
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @beehive
    assert_response :success
  end

  test "should update beehive" do
    sign_in users(:one)
    patch :update, id: @beehive, beehive: { mode: @beehive.mode, name: @beehive.name, position: @beehive.position, user_id: @beehive.user_id }
    assert_redirected_to beehive_path(assigns(:beehive))
  end

  test "should destroy beehive" do
    sign_in users(:one)
    assert_difference('Beehive.count', -1) do
      delete :destroy, id: @beehive
    end

    assert_redirected_to beehives_path
  end
end
