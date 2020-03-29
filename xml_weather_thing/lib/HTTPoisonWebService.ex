defmodule XMLWeatherThing.HTTPoisonWebService do
  alias XMLWeatherThing.WebService
  @behaviour WebService

  @impl WebService
  def make_request(url) do
    HTTPoison.get(url)
  end
end
