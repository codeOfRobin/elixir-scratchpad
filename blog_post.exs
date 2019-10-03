# https://www.theerlangelist.com/article/beyond_taskasync

defmodule Aggregator do
  def new, do: 1
  def value(aggregator), do: aggregator

  def multiply_result(aggregator, result) do
    aggregator * result
  end
end

defmodule AsyncAwait do
  def factorial(n) do
    Enum.to_list(1..n)
    |> Enum.chunk_every(5)
    |> Enum.map(&Task.async(fn -> multiplyEverythingInList(&1) end))
    |> collectResults
  end

  defp collectResults(tasks, aggregator \\ Aggregator.new())

  defp collectResults([], aggregator), do: Aggregator.value(aggregator)

  defp collectResults(tasks, aggregator) do
    receive do
      msg ->
        case Task.find(tasks, msg) do
          {result, task} ->
            collectResults(
              List.delete(tasks, task),
              Aggregator.multiply_result(aggregator, result)
            )

          nil ->
            collectResults(tasks, aggregator)
        end
    end
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

AsyncAwait.naiveFactorial(200_000)
