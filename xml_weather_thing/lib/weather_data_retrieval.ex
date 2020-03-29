defmodule XMLWeatherThing.WeatherDataRetrieval do
  @weather_service_url Application.get_env(:xml_weather_thing, :base_url)

  def retrieveWeatherFor(code) do
    urlFor(code)
    |> HTTPoison.get()
    |> handle_response()
  end

  def urlFor(code), do: "#{@weather_service_url}/xml/current_obs/#{code}.xml"

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    {
      :ok,
      body
    }
  end

  def handle_response({:ok, %{status_code: _, body: body}}) do
    {
      :error,
      body
    }
  end

  def handle_response({:error, response}) do
    {
      :error,
      response
    }
  end

  def check_status_code(200), do: :ok

  def check_status_code(_), do: :error
end
