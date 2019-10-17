defmodule Chap6Test do
  use ExUnit.Case
  doctest Chap6

  test "greets the world" do
    assert Chap6.hello() == :world
  end

  test "sum(n)" do
    assert Chap6.sum(3) == 6
  end
end
