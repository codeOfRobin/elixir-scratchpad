defmodule Chap6Test do
  use ExUnit.Case
  doctest Chap6

  test "greets the world" do
    assert Chap6.hello() == :world
  end
end
