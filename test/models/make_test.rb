require 'test_helper'

class MakeTest < ActiveSupport::TestCase
  test "missing name" do
    make = Make.create(country: "Germany")
    assert make.invalid?
    refute make.save
  end

  test "missing country" do
    make = Make.create(name: "Honda")
    assert make.invalid?
    refute make.save
  end

  test "attibutes present" do
    make = Make.create(name: "Honda", country: "Japan")
    assert make.valid?
    assert make.save
    assert_empty make.errors.messages
  end

  test "name must not be similar" do
    make = Make.create(name: "Toyota", country: "Japan")
    assert make.invalid?
    refute make.save
    assert_includes make.errors[:name], "has already been taken"
  end

  test "unique name is valid" do
    make = Make.create(name: "Brand", country: "Earth")
    assert make.valid?
    assert make.save
    assert_empty make.errors[:name]
  end

  test "name too long" do
    make = Make.create(name: "WhoWouldEverNameACarLikeThis", country: "USA")
    assert make.invalid?
    refute make.save
    assert_includes make.errors[:name], "is too long (maximum is 20 characters)"
  end

  test "name is valid length" do
    make = Make.create(name: "Brand", country: "Earth")
    assert make.valid?
    assert make.save
    assert_empty make.errors[:name]
  end
end
