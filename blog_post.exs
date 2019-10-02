# https://www.theerlangelist.com/article/beyond_taskasync

defmodule Debug do
  def printAndReturn(x) do
    IO.inspect(x)

    sum =
      Enum.reduce(x, 0, fn num, acc ->
        num + acc
      end)

    IO.inspect(sum)

    x
  end
end

defmodule Computation do
  def run(x) when x > 0 do
    # simulates a long-running operation
    :timer.sleep(x)
    x
  end
end

defmodule Aggregator do
  def new, do: 0
  def value(aggregator), do: aggregator

  def add_result(aggregator, result) do
    aggregator + result
  end
end

defmodule AsyncAwait do
  def run do
    :random.seed(:os.timestamp())

    1..10
    |> Enum.map(fn _ -> :random.uniform(1000) end)
    |> Debug.printAndReturn()
    |> Enum.map(&Task.async(fn -> Computation.run(&1) end))
    |> Enum.map(&Task.await/1)
    |> Enum.reduce(Aggregator.new(), &Aggregator.add_result(&2, &1))
    |> Aggregator.value()
  end

  def factorial(n) do
    numbers = Enum.to_list(1..n)
    subLists = Enum.chunk_every(numbers, div(Enum.count(numbers), 10))

    productList =
      Enum.map(subLists, &Task.async(fn -> multiplyEverythingInList(&1) end))
      |> Enum.map(&Task.await/1)

    multiplyEverythingInList(productList)
  end

  def multiplyEverythingInList(list) do
    Enum.reduce(list, 1, fn product, number ->
      product * number
    end)
  end

  def naiveFactorial(n) do
    case n do
      1 -> 1
      _ -> naiveFactorial(n - 1) * n
    end
  end
end

AsyncAwait.naiveFactorial(100_000)
