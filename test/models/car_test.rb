require 'test_helper'

class CarTest < ActiveSupport::TestCase
  setup do
    @make = makes(:one)
  end

  test "invalid without make" do
    #belongs_to association creates a validation by default
    c = Car.create(model: "Model", vin: "33CC44DD55")
    assert c.invalid?, "Car without make should be invalid"
    refute c.save
    assert_not_nil c.errors[:make]
  end

  test "invalid without VIN" do
    c = Car.create(make: @make, model: "Model")
    assert c.invalid?, "Car without VIN should be invalid"
    refute c.save
    assert_includes c.errors[:vin], "can't be blank"
  end

  test "invalid without model" do
    c = Car.create(make: @make, vin: "33CC44DD55")
    assert c.invalid?, "Car without model should be invalid"
    refute c.save
    assert_includes c.errors[:model], "can't be blank"
  end

  # Real VIN are 17 digits, here they will be 10
  test "VIN is length 10" do
    valid_size = 10
    c = Car.create(make: @make, model: "Model", vin: "33CC44DD55")
    assert c.valid?
    assert c.save
    assert_equal valid_size, c.vin.size, "VIN should be 10 characters long"
    assert_empty c.errors.messages
  end

  test "VIN too short" do
    c = Car.create(make: @make, model: "Model", vin: "33CC44DD")
    assert c.invalid?, "VIN length should be invalid"
    refute c.save
    assert_includes c.errors[:vin], "is the wrong length (should be 10 characters)"
  end

  test "VIN too long" do
    c = Car.create(make: @make, model: "Model", vin: "33CC44DD55EE")
    assert c.invalid?, "VIN length should be invalid"
    refute c.save
    assert_includes c.errors[:vin], "is the wrong length (should be 10 characters)"
  end

  test "VINs cannot be similar" do
    c = Car.create(make: @make, model: "Model", vin: "11AA22BB33")
    assert c.invalid?, "VIN must be unique"
    refute c.save
    assert_includes c.errors[:vin], "has already been taken"
  end

  test "unique VIN is valid" do
  end

  test "model too short" do
    c = Car.create(make: @make, model: "A", vin: "33CC44DD55")
    assert c.invalid?, "Model length should be invalid, should be less than 2"
    refute c.save
    assert_includes c.errors[:model], "is too short (minimum is 2 characters)"
  end

  test "model too long" do
    c = Car.create(make: @make, model: "ModelNameIsWayTooLong", vin: "33CC44DD55")
    assert c.invalid?, "Model length should be invalid, should be greater than 20"
    refute c.save
    assert_includes c.errors[:model], "is too long (maximum is 20 characters)"
  end

  test "model length valid" do
    c = Car.create(make: @make, model: "This One Is Valid", vin: "33CC44DD55")
    assert c.valid?, "Model length is invalid, should be 2..20"
    assert c.save
    assert_empty c.errors.messages
  end
end
