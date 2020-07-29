require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
  end

  test "should get index" do
    get cars_path
    assert_response :success
  end

  test "should get new" do
    get new_car_path
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post cars_path, params: { car: { model: @car.model, vin: @car.vin, make_id: @car.make_id} }
    end

    assert_redirected_to car_path(Car.last)
  end

  test "should show car" do
    get car_path(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_path(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_path(@car), params: { car: { model: @car.model, vin: @car.vin, make_id: @car.make_id} }
    assert_redirected_to car_path(@car)
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_path(@car)
    end

    assert_redirected_to cars_path
  end
end
