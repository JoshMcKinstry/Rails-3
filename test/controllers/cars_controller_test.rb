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
      post cars_path, params: { car: { model: @car.model, vin: "54321EDCBA", make_id: @car.make_id} }
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

  test "searches return 200" do
    get search_cars_path, params: {search: "Mustang"}
    assert_response 200
  end

  test "should find by make names" do
    get search_cars_path, params: {search: "Ford"}
    assert_select 'td', 'Ford'
  end

  test "should find by make countries" do
    get search_cars_path, params: {search: "Japan"}
    assert_select 'td', 'Toyota'
  end

  test "should find by model" do
    get search_cars_path, params: {search: "Mustang"}
    assert_select 'td', 'Ford'
  end

  test "should find by VIN" do
    get search_cars_path, params: {search: "11AA22BB33"}
    assert_select 'td', 'Toyota'
  end

  test "should not find Bogus" do
    get search_cars_path, params: {search: "Bogus"}
    assert_select 'td', false
  end
    
end
