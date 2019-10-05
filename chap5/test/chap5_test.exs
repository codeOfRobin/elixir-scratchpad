defmodule Chap5Test do
  use ExUnit.Case
  doctest Chap5

  test "greets the world" do
    assert Chap5.hello() == :world
  end
end
