defmodule Chap11 do
  @moduledoc """
  Documentation for Chap11.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chap11.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  iex> Chap11.containsOnlyPrintableCharacters('abc' ++ [0])
  false
  """
  def containsOnlyPrintableCharacters([]), do: true

  def containsOnlyPrintableCharacters([head | tail]) when ' ' < head and head < '~' do
    containsOnlyPrintableCharacters(tail)
  end

  def containsOnlyPrintableCharacters(_) do
    false
  end

  @doc """
  iex> Chap11.anagram?('GeorgeBush', 'heBugsGore')
  true
  iex> Chap11.anagram?('akdsjfnaskdjf', 'asdflmsdflas')
  false
  """
  def anagram?(word1, word2) do
    Enum.empty?(word1 -- word2)
  end

  _ = """
  about
  iex(2)> ['cat' | 'dog']
  ['cat', 100, 111, 103]
  the reason is - elixir array syntax is [head | tail] where tail is the rest of the list! so rather than being treated as a series of elements rather than one element
  """

  def calculateExpression(number1, ?+, number2), do: number1 + number2

  def calculateExpression(number1, ?-, number2), do: number1 - number2

  def calculateExpression(number1, ?*, number2), do: number1 * number2

  def calculateExpression(number1, ?/, number2), do: number1 / number2

  @doc """
  iex> Chap11.parseDigits('123')
  {123, ''}
  """
  def parseDigits(str), do: parseDigits(str, 0)

  def parseDigits([head | tail], value) when head in '0123456789' do
    parseDigits(tail, value * 10 + head - ?0)
  end

  def parseDigits(leftoverCharacters, value) do
    {value, leftoverCharacters}
  end

  @doc """
  iex> Chap11.calculate('123+27')
  150
  """
  def calculate(string) do
    {number1, [operator | tail]} =
      string
      |> parseDigits()

    {number2, _} = tail |> parseDigits()

    calculateExpression(number1, operator, number2)
  end

  def center(strings) do
    maxLength = Enum.max_by(strings, &String.length(&1)) |> String.length()

    result =
      Enum.reduce(strings, "", fn string, result ->
        padding = (maxLength - String.length(string)) |> div(2)

        finalString =
          string
          |> String.pad_trailing(String.length(string) + padding + 1)
          |> String.pad_leading(maxLength)

        result <> finalString <> "\n"
      end)

    IO.puts(result)
  end

  @doc """
  iex> Chap11.capitalize_sentences("oh. a DOG. woof. ")
  "Oh. A dog. Woof. "
  """
  def capitalize_sentences(string) do
    String.split(string, ". ")
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(". ")
  end

  def addTaxToOrders(taxes, orders) do
    for order <- orders,
        do:
          order ++
            [
              net_plus_tax:
                order[:net_amount] + (taxes[order[:ship_to]] || 0.0) * order[:net_amount]
            ]
  end

  def readFromFile() do
    tax_rates = [NC: 0.075, TX: 0.08]

    File.stream!("lib/test.csv")
    |> Stream.drop(1)
    |> Stream.map(&String.trim(&1))
    |> Stream.map(fn line ->
      [id, ship_to, net_amount] = String.split(line, ",")

      [id: id, ship_to: String.to_atom(ship_to), net_amount: String.to_float(net_amount)]
    end)
    |> Stream.map(fn order ->
      order ++
        [
          net_plus_tax:
            order[:net_amount] + (tax_rates[order[:ship_to]] || 0.0) * order[:net_amount]
        ]
    end)
    |> Enum.to_list()
  end
end
