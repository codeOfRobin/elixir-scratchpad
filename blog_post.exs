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
end

IO.puts(AsyncAwait.run())
