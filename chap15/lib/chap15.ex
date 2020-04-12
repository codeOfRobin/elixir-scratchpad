defmodule Chap15 do
  @moduledoc """
  Documentation for `Chap15`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Chap15.hello()
      :world

  """
  def hello do
    :world
  end

  def main do
    # here's a client
    pid = spawn(Spawnee, :greet, [])
    send(pid, {self(), "World!"})

    receive do
      {:ok, message} -> IO.puts(message)
    end

    send(pid, {self(), "Kermit!"})

    receive do
      {:ok, message} -> IO.puts(message)
    after
      500 ->
        IO.puts("The greeter has gone away!")
    end
  end
end
