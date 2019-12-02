defmodule Chap8 do
  @moduledoc """
  Documentation for Chap8.
  """

  def main do
    Query.gibPeople() |> Enum.each(&HotelRoom.book/1)
  end
end

defmodule Canvas do
  @defaults [fg: "black", bg: "white", font: "Helvetica"]

  def draw_text(text, options \\ []) do
  end
end

defmodule Query do
  @people [
    %{name: "Grumpy", height: 1.24},
    %{name: "Dave", height: 1.88},
    %{name: "Dopey", height: 1.32},
    %{name: "Shaquille", height: 2.16},
    %{name: "Sneezy", height: 1.28}
  ]

  def runQuery() do
    IO.inspect(for person = %{height: height} <- @people, height > 1.5, do: person)
  end

  def gibPeople() do
    @people
  end
end

defmodule HotelRoom do
  def book(%{name: name, height: height}) when height > 1.9 do
    IO.puts("Need extra-long bed for #{name}")
  end

  def book(%{name: name, height: height}) when height < 1.3 do
    IO.puts("Need low shower controls for #{name}")
  end

  def book(person) do
    IO.puts("Need regular bed for #{person.name}")
  end
end

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts("Very cheap badge for #{name}")
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end
