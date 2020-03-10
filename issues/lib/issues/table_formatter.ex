defmodule Issues.TableFormatter do
  import Enum, only: [each: 2, map: 2, map_join: 3, max: 1, zip: 2]

  @simple_test_data [
    [c123456789: "r1 c1", c2: "r1 c2", c3: "r1 c3", c4: "r1+++c4"],
    [c123456789: "r2 c1", c2: "r2 c2", c3: "r2 c3", c4: "r2 c4"],
    [c123456789: "r3 c1", c2: "r3 c2", c3: "r3 c3", c4: "r3 c4"],
    [c123456789: "r4 c1", c2: "r4++c2", c3: "r4 c3", c4: "r4 c4"]
  ]

  @headers [:c123456789, :c2, :c3, :c4]

  def printable(str) when is_binary(str), do: str
  def printable(str), do: to_string(str)

  def convert_to_columns(data, headers) do
    columnar_data =
      for header <- headers do
        for row <- data, do: printable(row[header])
      end

    %{headers: headers, columns: columnar_data}
  end

  def max_width(%{columns: columns, headers: headers}) do
    for {column, header} <- zip(columns, headers) do
      max(
        column
        |> map(&String.length/1)
        |> max,
        header
        |> to_string
        |> String.length()
      )
    end
  end

  def header_separating_line(widths, separator \\ "+", line_character \\ "-") do
    for width <- widths do
      String.duplicate(line_character, width)
    end
    |> Enum.join(separator)
  end

  def test() do
    widths = convert_to_columns(@simple_test_data, @headers)
              |> max_width()
              |> header_separating_line()
  end
end
