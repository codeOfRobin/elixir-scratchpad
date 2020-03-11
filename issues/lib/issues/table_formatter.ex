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
    widths
    |> Enum.map(&String.duplicate(line_character, &1))
    |> Enum.join(separator)
  end

  def pad_string({string, width}) do
    String.pad_trailing(to_string(string), width)
  end
  
  def render_headings(headings, widths) do
    zip(headings, widths)
    |> Enum.map(&pad_string/1)
    |> Enum.join("|")
  end

  def render_header(headings, widths) do
    render_headings(headings, widths)<>"\n"<>header_separating_line(widths)
  end

  def render_rows(data, headers, widths) do
    render_row = fn (items) ->
        headers
        |> Enum.map(&(items[&1]))
        |> Enum.zip(widths)
        |> Enum.map(&pad_string/1)
        |> Enum.join("|")
      end
    data
    |> Enum.map(render_row)
    |> Enum.join("\n")
  end
  
  def render_table(data, headers) do
    widths = convert_to_columns(@simple_test_data, @headers)
              |> max_width()
    render_header(@headers, widths)
    <> "\n" <>
    render_rows(@simple_test_data, @headers, widths)
  end
end
