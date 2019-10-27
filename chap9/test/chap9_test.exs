defmodule Chap9Test do
  use ExUnit.Case
  doctest Chap9
  doctest MyEnum

  test "greets the world" do
    assert Chap9.hello() == :world
  end

  test "our reduce works just like the others" do
    additionAccumulator = fn acc, element -> element + acc end
    seq = [1, 2, 3, 4, 5, 6]
    assert MyEnum.reduce(seq, 0, additionAccumulator) == Enum.reduce(seq, 0, additionAccumulator)
  end

  test "our filter" do
    filterCondition = fn element -> rem(element, 2) == 0 end
    seq = [1, 2, 3, 4, 5, 6]
    assert MyEnum.filter(seq, filterCondition) == Enum.filter(seq, filterCondition)
  end
end
