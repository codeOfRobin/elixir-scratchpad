defmodule Chap12 do
  @moduledoc """
  Documentation for Chap12.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chap12.hello()
      :world
  """
  def hello do
    :world
  end

  def upto(n) when n > 0, do: 1..n |> Enum.map(&caseFizzBuzz/1)

  @doc """
  iex> Chap12.caseFizzBuzz(15)
  "FizzBuzz"

  iex> Chap12.caseFizzBuzz(5)
  "Buzz"

  iex> Chap12.caseFizzBuzz(3)
  "Fizz"

  iex> Chap12.caseFizzBuzz(4)
  4
  """
  def caseFizzBuzz(n) do
    case {n, rem(n, 3), rem(n,5) } do
      {_, 0, 0} -> "FizzBuzz"
      {_, 0, _} -> "Fizz"
      {_, _, 0} -> "Buzz"
      {_, _, _} -> n
    end
  end

  def ok!(param) do
    case param do
      {:ok, data} -> data
      _ -> raise RuntimeError, param
    end
  end
end
