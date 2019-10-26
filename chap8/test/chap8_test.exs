defmodule Chap8Test do
  use ExUnit.Case
  doctest Chap8

  test "greets the world" do
    assert Chap8.hello() == :world
  end
end
