defmodule Factorial do
  def factorial_memoized(n, memo \\ %{}) do
    case n do
      1 ->
        {1, memo}

      _ ->
        if Map.has_key?(memo, n) do
          {memo[n], memo}
        else
          {prevFactorial, newMemo} = factorial_memoized(n - 1, memo)
          value = prevFactorial * n
          {value, Map.merge(newMemo, %{n => value})}
        end
    end
  end

  def factorialParallel(n) do
    let(tasks)
  end

  def factorial(n) do
    {value, _} = factorial_memoized(n)
    value
  end

  def factorial_unmemoized(n) do
    case n do
      1 -> 1
      _ -> factorial_unmemoized(n - 1) * n
    end
  end
end

# IO.puts(Factorial.factorial_unmemoized(1_000_000))
IO.puts(Factorial.factorial(100))
