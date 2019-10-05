defmodule Chap5 do
  @moduledoc """
  Documentation for Chap5.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chap5.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  iex> Chap5.add(39,3)
  42
  """
  def add(a, b) do
    a + b
  end

  @doc """
  iex> Chap5.list_concat([:a, :b], [:c, :d])
  [:a, :b, :c, :d]
  """
  def list_concat(a, b) do
    a ++ b
  end

  @doc """
  iex> Chap5.pair_tuple_to_list( { 1234, 5678 } )
  [ 1234, 5678 ]
  """
  def pair_tuple_to_list({a, b}) do
    [a, b]
  end
end
