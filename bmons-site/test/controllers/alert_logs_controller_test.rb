require 'test_helper'

class AlertLogsControllerTest < ActionController::TestCase
  setup do
    @alert_log = alert_logs(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:alert_logs)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create alert_log" do
    sign_in users(:one)
    assert_difference('AlertLog.count') do
      post :create, alert_log: { alert_id: @alert_log.alert_id, datetime: @alert_log.datetime, message: @alert_log.message, recipient: @alert_log.recipient, status: @alert_log.status }
    end

    assert_redirected_to alert_log_path(assigns(:alert_log))
  end

  test "should show alert_log" do
    sign_in users(:one)
    get :show, id: @alert_log
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @alert_log
    assert_response :success
  end

  test "should update alert_log" do
    sign_in users(:one)
    patch :update, id: @alert_log, alert_log: { alert_id: @alert_log.alert_id, datetime: @alert_log.datetime, message: @alert_log.message, recipient: @alert_log.recipient, status: @alert_log.status }
    assert_redirected_to alert_log_path(assigns(:alert_log))
  end

  test "should destroy alert_log" do
    sign_in users(:one)
    assert_difference('AlertLog.count', -1) do
      delete :destroy, id: @alert_log
    end

    assert_redirected_to alert_logs_path
  end
end
