defmodule HelloSocketsWeb.WildcardChannel do
  use Phoenix.Channel

  def join("wild:" <> numbers, _payload, socket) do
    case(numbers_correct?(numbers)) do
      true -> {:ok, socket}
      _ -> {:error, %{}}
    end
  end

  defp numbers_correct?(numbers) do
    numbers
    |> String.split(":")
    |> Enum.map(&String.to_integer/1)
    |> case do
      [a, b] when b == a * 2 -> true
      _ -> false
    end
  end
end
