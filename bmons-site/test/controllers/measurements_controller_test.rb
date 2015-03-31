require 'test_helper'

class MeasurementsControllerTest < ActionController::TestCase
  setup do
    @measurement = measurements(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:measurements)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create measurement" do
    sign_in users(:one)
    assert_difference('Measurement.count') do
      post :create, measurement: { datetime: @measurement.datetime, sensor_id: @measurement.sensor_id, value: @measurement.value }
    end

    assert_redirected_to measurement_path(assigns(:measurement))
  end

  test "should show measurement" do
    sign_in users(:one)
    get :show, id: @measurement
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @measurement
    assert_response :success
  end

  test "should update measurement" do
    sign_in users(:one)
    patch :update, id: @measurement, measurement: { datetime: @measurement.datetime, sensor_id: @measurement.sensor_id, value: @measurement.value }
    assert_redirected_to measurement_path(assigns(:measurement))
  end

  test "should destroy measurement" do
    sign_in users(:one)
    assert_difference('Measurement.count', -1) do
      delete :destroy, id: @measurement
    end

    assert_redirected_to measurements_path
  end
end
