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
end
