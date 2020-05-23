defmodule HelloSocketsWeb.WildcardChannel do
  use Phoenix.Channel

  def join("wild:" <> numbers, _payload, socket) do
    case(numbers_correct?(numbers)) do
      true -> {:ok, socket}
      _ -> {:error, %{}}
    end
  end

  def handle_in("ping", _payload, socket) do
    {:reply, {:ok, %{ping: "pong"}}, socket}
  end

  def safeInteger(string) do
    try do
      String.to_integer(string)
    rescue
      ArgumentError -> :error
    end
  end

  def numbers_correct?(numbers) do
    numbers
    |> String.split(":")
    |> Enum.map(&safeInteger/1)
    |> case do
      [a, b] when b == a * 2 -> true
      _ -> false
    end
  end
end
