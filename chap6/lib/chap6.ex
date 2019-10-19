defmodule Chap6 do
  @moduledoc """
  Documentation for Chap6.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chap6.hello()
      :world

  """
  def hello do
    :world
  end

  def double(n) do
    n * 2
  end

  @doc """
  iex> Chap6.triple(3)
  9
  """
  def triple(n) do
    n * 3
  end

  @doc """
  iex> Chap6.quad(4)
  16
  """
  def quad(n) do
    n |> double |> double
  end

  def sum(1), do: 1
  def sum(n), do: n + sum(n - 1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

  @doc """
  iex> Chap6.guess(273, 1..1000)
  272
  """
  def guess(number, range) do
    guess(number, range, div(range.first + range.last, 2))
  end

  def guess(number, range, currentlyGuessedNumber) when currentlyGuessedNumber > number do
    IO.puts("Is it #{currentlyGuessedNumber}")
    guess(number, range.first..currentlyGuessedNumber)
  end

  def guess(number, range, currentlyGuessedNumber) when currentlyGuessedNumber < number do
    IO.puts("Is it #{currentlyGuessedNumber}")
    guess(number, currentlyGuessedNumber..range.last)
  end

  def guess(number, _range, currentlyGuessedNumber) when currentlyGuessedNumber == number do
    IO.puts("Is it #{currentlyGuessedNumber}")
    currentlyGuessedNumber
  end
end
