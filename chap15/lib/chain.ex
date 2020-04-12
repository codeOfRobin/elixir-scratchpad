defmodule Chain do
  def counter(observer) do
    receive do
      number ->
        send(observer, number + 1)
    end
  end

  def process(n) do
    lastObserver =
      Enum.reduce(1..n, self(), fn _, observer ->
        spawn(Chain, :counter, [observer])
      end)

    send(lastObserver, 0)

    receive do
      final_number ->
        "Result is #{final_number}"
    end
  end

  def run(n) do
    :timer.tc(Chain, :process, [n])
    |> IO.inspect()
  end
end
