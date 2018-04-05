defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

 test "addition" do
    assert Calc.eval("2 + 3") == "5"
  end

  test "multiple addition" do
    assert Calc.eval("3 + 3 + 3 + 3") == "12"
  end

  test "subtraction" do
    assert Calc.eval("50 - 25") == "25"
  end

  test "multiple subtraction" do
    assert Calc.eval("50 - 10 - 8") == "32"
  end

  test "multiplication" do
    assert Calc.eval("5 * 1") == "5"
  end

  test "multiple multiplication" do
    assert Calc.eval("5 * 4 * 3") == "60"
  end

  test "division" do
    assert Calc.eval("40 / 8") == "5"
  end

  test "many division" do
    assert Calc.eval("40 / 2 / 4") == "5"
  end

  test "mmultiplication division" do
    assert Calc.eval("48 / 3 * 2 * 2") == "64"
  end

  test "addition division" do
    assert Calc.eval("16 + 16 / 4 / 2") == "18"
  end

  test "parenthesis" do
    assert Calc.eval("(14 + 10) * 4") == "96"
  end

  test "multiplication addition" do
  	assert Calc.eval("1 + 3 * 3 + 1") == "11"
  end

  test "test add div" do
  	assert Calc.eval("24 / 6 + (5 - 4)") == "5"
  end

 test "div" do
  	assert Calc.eval("20 / 4") == "5"
  end

end