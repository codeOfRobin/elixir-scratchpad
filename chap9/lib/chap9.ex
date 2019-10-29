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

  def split(sequence) do
  end

  def split(sequence) do
  end
end
