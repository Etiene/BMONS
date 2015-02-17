require 'test_helper'

class AlertsControllerTest < ActionController::TestCase
  setup do
    @alert = alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alert" do
    assert_difference('Alert.count') do
      post :create, alert: { active: @alert.active, comparison: @alert.comparison, frequency: @alert.frequency, message: @alert.message, sensor_id: @alert.sensor_id, threshold: @alert.threshold, type: @alert.type, user_id: @alert.user_id }
    end

    assert_redirected_to alert_path(assigns(:alert))
  end

  test "should show alert" do
    get :show, id: @alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alert
    assert_response :success
  end

  test "should update alert" do
    patch :update, id: @alert, alert: { active: @alert.active, comparison: @alert.comparison, frequency: @alert.frequency, message: @alert.message, sensor_id: @alert.sensor_id, threshold: @alert.threshold, type: @alert.type, user_id: @alert.user_id }
    assert_redirected_to alert_path(assigns(:alert))
  end

  test "should destroy alert" do
    assert_difference('Alert.count', -1) do
      delete :destroy, id: @alert
    end

    assert_redirected_to alerts_path
  end
end
