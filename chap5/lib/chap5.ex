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

  def file_thing() do
    handle_open = fn
      {:ok, file} -> "First line #{IO.read(file, :line)}"
      {_, error} -> "Error: #{:file.format_error(error)}"
    end

    IO.inspect(handle_open.(File.open("mix.exs")))
    IO.inspect(handle_open.(File.open("Rakefile")))
  end

  @doc """
  iex> Chap5.yayWaitWTFFizzBuzz({0,0,12123})
  "FizzBuzz"
  iex> Chap5.yayWaitWTFFizzBuzz({0,1232123,12123})
  "Fizz"
  iex> Chap5.yayWaitWTFFizzBuzz({123123123,0,12123})
  "Buzz"
  iex> Chap5.yayWaitWTFFizzBuzz({123123123,1231231,5})
  5
  """
  def yayWaitWTFFizzBuzz(args) do
    case args do
      {0, 0, _} ->
        "FizzBuzz"

      {0, _, _} ->
        "Fizz"

      {_, 0, _} ->
        "Buzz"

      {_, _, c} ->
        c
    end
  end

  @doc """
  iex> Chap5.actualFizzBuzz(10)
  "Buzz"
  iex> Chap5.actualFizzBuzz(11)
  11
  iex> Chap5.actualFizzBuzz(12)
  "Fizz"
  iex> Chap5.actualFizzBuzz(13)
  13
  iex> Chap5.actualFizzBuzz(14)
  14
  iex> Chap5.actualFizzBuzz(15)
  "FizzBuzz"
  iex> Chap5.actualFizzBuzz(16)
  16
  """
  def actualFizzBuzz(n) do
    yayWaitWTFFizzBuzz({rem(n, 3), rem(n, 5), n})
  end

  @doc """
  iex> Chap5.prefix("Elixir").("Rocks")
  "Elixir Rocks"
  """
  def prefix(string) do
    fn string2 -> "#{string} #{string2}" end
  end
end
