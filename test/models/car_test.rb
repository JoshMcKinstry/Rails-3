require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test "invalid without make" do
    #belongs_to association creates a validation by default
    c = Car.create({:model => "Model", :vin => "12345ABCDE"})
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

  # Real VIN are 17 digits, here they will be 10
  test "VIN is length 10" do
    c = cars(:one)
    assert c.valid?
    assert_equal 10, c.vin.size, "VIN should be 10 characters long"
    assert_equal({}, c.errors.messages)
  end

  test "VIN cannot be less than 10" do
    c = cars(:tooshort)
    assert c.invalid?, "VIN can only be 10 characters"
    assert_not_empty c.errors[:vin]
  end

  test "VIN cannot be greater than 10" do
    c = cars(:toolong)
    assert c.invalid?, "VIN can only be 10 characters"
    assert_not_empty c.errors[:vin]
  end

  test "VIN must be unique" do
    c = Car.create({:make_id => 1, :model => "Model", :vin => "11AA22BB33"})
    assert c.invalid?, "VIN must be unique"
    refute c.save
    assert_not_empty c.errors[:vin]
  end
end
