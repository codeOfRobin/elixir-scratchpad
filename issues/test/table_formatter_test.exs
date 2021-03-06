defmodule TableFormatterTest do
  # bring in the test functionality
  use ExUnit.Case
  # And allow us to capture stuff sent to stdout
  import ExUnit.CaptureIO
  alias Issues.TableFormatter, as: TF

  @simple_test_data [
    [c123456789: "r1 c1", c2: "r1 c2", c3: "r1 c3", c4: "r1+++c4"],
    [c123456789: "r2 c1", c2: "r2 c2", c3: "r2 c3", c4: "r2 c4"],
    [c123456789: "r3 c1", c2: "r3 c2", c3: "r3 c3", c4: "r3 c4"],
    [c123456789: "r4 c1", c2: "r4++c2", c3: "r4 c3", c4: "r4 c4"]
  ]

  @headers [:c123456789, :c2, :c3, :c4]

  test "header separator" do
    test_output = """
    c123456789|c2    |c3   |c4     
    ----------+------+-----+-------
    r1 c1     |r1 c2 |r1 c3|r1+++c4
    r2 c1     |r2 c2 |r2 c3|r2 c4  
    r3 c1     |r3 c2 |r3 c3|r3 c4  
    r4 c1     |r4++c2|r4 c3|r4 c4  
    """
    assert Issues.TableFormatter.print_table_for_columns(@simple_test_data, @headers) == test_output
  end

end
