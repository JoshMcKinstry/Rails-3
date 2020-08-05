require 'test_helper'

class PartTest < ActiveSupport::TestCase
  test "missing part name" do
    p = Part.create()
    assert p.invalid?
    refute p.save
    assert_includes p.errors[:name], "can't be blank" 
  end

  test "name present" do
    p = Part.create(name: "NewPart")
    assert p.valid?
    assert p.save
    assert_empty p.errors[:name]
  end

  test "part names must not be similar" do
    p = Part.create(name: "Engine")
    assert p.invalid?
    refute p.save
    assert_includes p.errors[:name], "has already been taken"
  end

  test "unique part name is valid" do
    p = Part.create(name: "MyPart")
    assert p.valid?
    assert p.save
    assert_empty p.errors[:name]
  end

  test "part name too long" do
    p = Part.create(name: "ThisPartNameIsRidiculouslyLong")
    assert p.invalid?
    refute p.save
    assert_includes p.errors[:name], "is too long (maximum is 20 characters)"
  end

  test "part name length is valid" do
    p = Part.create(name: "MyPart")
    assert p.valid?
    assert p.save
    assert_empty p.errors[:name]
  end
end
