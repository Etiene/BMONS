require 'test_helper'

class BeehivesControllerTest < ActionController::TestCase
  setup do
    @beehive = beehives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beehives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beehive" do
    assert_difference('Beehive.count') do
      post :create, beehive: { mode: @beehive.mode, name: @beehive.name, position: @beehive.position, user_id: @beehive.user_id }
    end

    assert_redirected_to beehive_path(assigns(:beehive))
  end

  test "should show beehive" do
    get :show, id: @beehive
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @beehive
    assert_response :success
  end

  test "should update beehive" do
    patch :update, id: @beehive, beehive: { mode: @beehive.mode, name: @beehive.name, position: @beehive.position, user_id: @beehive.user_id }
    assert_redirected_to beehive_path(assigns(:beehive))
  end

  test "should destroy beehive" do
    assert_difference('Beehive.count', -1) do
      delete :destroy, id: @beehive
    end

    assert_redirected_to beehives_path
  end
end
