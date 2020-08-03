require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test "invalid without make" do
    #belongs_to association creates a validation by default
    c = cars(:nomake)
    assert c.invalid?, "Car without make should be invalid"
    refute c.save
    assert_not_nil c.errors[:make]
  end

  test "invalid without VIN" do
    c = cars(:novin)
    assert c.invalid?, "Car without VIN should be invalid"
    refute c.save
    assert_not_nil c.errors[:vin]
  end

  test "invalid without model" do
    c = cars(:nomodel)
    assert c.invalid?, "Car without model should be invalid"
    refute c.save
    assert_not_nil c.errors[:model]
  end

  test "VIN is length 17" do
    c = cars(:one)
    assert_equal 17, c.vin.size, "VIN should be 17 characters long"
    assert_nil c.errors.messages
  end
end
