defmodule XMLWeatherThing.WebService do
  @callback make_request(url :: String.t()) :: {:error, any} | {:ok, HTTPoison.Response.t()}
end
