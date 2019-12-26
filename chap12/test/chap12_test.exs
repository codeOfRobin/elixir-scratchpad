defmodule Chap12Test do
  use ExUnit.Case
  doctest Chap12

  test "greets the world" do
    assert Chap12.hello() == :world
  end
end
