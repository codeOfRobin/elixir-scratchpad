defmodule Chap7 do
  @moduledoc """
  Documentation for Chap7.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chap7.hello()
      :world

  """
  def hello do
    :world
  end
end

defmodule MyList do
  @doc """
  iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
  14
  """
  def mapsum(list, func) do
    list
    |> Enum.map(&func.(&1))
    |> Enum.reduce(0, &(&1 + &2))
  end

  @doc """
  iex > MyList.max([1,2,100,3,5])
  100
  """
  def max(list) do
    [first | _] = list

    list
    |> Enum.reduce(first, fn maxSoFar, element ->
      if maxSoFar < element, do: element, else: maxSoFar
    end)
  end

  @doc """
  iex> MyList.caesar('ryvkve', 13)
  [127, 134, 131, 120, 131, 114]
  """
  def caesar(string, n) do
    string
    |> Enum.map(&(&1 + n))
  end

  def span(from, to) do
    from..to
  end

  def do
  end
end
