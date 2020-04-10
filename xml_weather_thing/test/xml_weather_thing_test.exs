defmodule XMLWeatherThingTest do
  use ExUnit.Case
  doctest XMLWeatherThing

  test "greets the world" do
    assert XMLWeatherThing.hello() == :world
  end

  test "fake service works" do
    IO.inspect(
      XMLWeatherThing.WeatherDataRetrieval.retrieveWeatherFor(
        "something",
        TestFakeWebService
      )
    )
  end
end
