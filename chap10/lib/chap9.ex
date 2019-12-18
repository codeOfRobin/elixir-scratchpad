defmodule Chap9 do
  @moduledoc """
  Documentation for Chap9.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chap9.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule MyEnum do
  @doc """
  iex> MyEnum.all?([2,4,6,8], fn x -> rem(x,2) == 0 end)
  true
  iex> MyEnum.all?([1,2,3,4], fn x -> rem(x,2) == 0 end)
  false
  """

  def all?([], _filterFunc), do: true

  def all?(sequence, filterFunc) do
    [head | tail] = sequence

    case filterFunc.(head) do
      false -> false
      true -> all?(tail, filterFunc)
    end
  end

  def each(sequence, closure) do
    case sequence do
      [head | tail] ->
        closure.(head)
        each(tail, closure)

      [] ->
        :ok
    end
  end

  def reduce(sequence, initial, closure) do
    case sequence do
      [] ->
        initial

      [head | tail] ->
        reduce(tail, closure.(initial, head), closure)
    end
  end

  def filter(sequence, closure) do
    reduce(sequence, [], fn result, element ->
      if closure.(element) do
        result ++ [element]
      else
        result
      end
    end)
  end

  def split(sequence, count) do
    split(sequence, count, [])
  end

  def split([], _count, splitted) do
    {splitted, []}
  end

  def split(sequence, 0, splitted) do
    {splitted, sequence}
  end

  def split(sequence, count, splitted) do
    [head | tail] = sequence
    split(tail, count - 1, splitted ++ [head])
  end

  def take(sequence, count) do
    {taken, _} = split(sequence, count)
    taken
  end

  @doc """
  iex> MyEnum.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
  [1,2,3,4,5,6]
  """
  def flatten([head | tail]) do
    flatten(head) ++ flatten(tail)
  end

  def flatten([]), do: []

  def flatten(element), do: [element]
end

defmodule Chap10 do
  def primeNumbersUpto(n) do
    for x <- 2..n, Enum.count(for y <- 2..div(n, 2), rem(x, y) == 0, do: x) == 0, do: x
  end

  # tax_rates = [ NC: 0.075, TX: 0.08 ]
  # orders = [
  #   [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  #   [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  #   [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  #   [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  #   [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  #   [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  #   [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  #   [ id: 130, ship_to: :NC, net_amount: 50.00 ]
  # ]
  def addTaxToOrders(taxes, orders) do
    for order <- orders,
        do:
          order ++
            [
              net_plus_tax:
                order[:net_amount] + (taxes[order[:ship_to]] || 0.0) * order[:net_amount]
            ]
  end
end
