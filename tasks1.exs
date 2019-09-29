defmodule Fib do
  def fib_memoized(n, memo \\ %{}) do
    case n do
      0 ->
        {0, memo}

      1 ->
        {1, memo}

      _ ->
        if Map.has_key?(memo, n) do
          {memo[n], memo}
        else
          {n1, memo1} = fib_memoized(n - 1, memo)
          {n2, memo2} = fib_memoized(n - 2, memo1)

          value = n1 + n2

          {value, Map.merge(memo2, %{n => value})}
        end
    end
  end

  def fib(n) do
    {value, _} = fib_memoized(n)
    value
  end
end

IO.puts(Fib.fib(1000))

# IO.puts("Start the task")
# worker = Task.async(fn -> Fib.of(40) end)
# IO.puts "Do something else"
# # ...lol
# IO.puts "Wait for the task"
# result = Task.await(worker)
# IO.puts "The result is #{result}"

# worker = Task.async(Fib, :of, [40])
# result = Task.await(worker)
# IO.puts "The result is #{result}"
