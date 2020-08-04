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
    make = Make.create(name: "Honda", country: "Japan"))
    assert make.valid?
    assert make.save
  end

  test "name must not be similar" do
  end

  test "unique name is valid" do
  end

  test "name too long" do
  end

  test "name is valid length" do
  end

end
