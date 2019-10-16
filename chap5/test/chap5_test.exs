defmodule Chap5Test do
  use ExUnit.Case
  doctest Chap5

  test "greets the world" do
    assert Chap5.hello() == :world
  end

  test "Exercise: Functions-5 question 1" do
    l1 = Enum.map([1, 2, 3, 4], fn x -> x + 2 end)
    l2 = Enum.map([1, 2, 3, 4], &(&1 + 2))

    assert l1 == l2
  end
end
