defmodule TestFakeWebService do
  alias XMLWeatherThing.WebService

  @behaviour WebService

  @impl WebService
  def make_request(_url) do
    {
      :ok,
      %HTTPoison.Response{
        body:
          "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?> \r\n<?xml-stylesheet href=\"latest_ob.xsl\" type=\"text/xsl\"?>\r\n<current_observation version=\"1.0\"\r\n\t xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"\r\n\t xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n\t xsi:noNamespaceSchemaLocation=\"http://www.weather.gov/view/current_observation.xsd\">\r\n\t<credit>NOAA's National Weather Service</credit>\r\n\t<credit_URL>http://weather.gov/</credit_URL>\r\n\t<image>\r\n\t\t<url>http://weather.gov/images/xml_logo.gif</url>\r\n\t\t<title>NOAA's National Weather Service</title>\r\n\t\t<link>http://weather.gov</link>\r\n\t</image>\r\n\t<suggested_pickup>15 minutes after the hour</suggested_pickup>\r\n\t<suggested_pickup_period>60</suggested_pickup_period>\n\t<location>Denton Enterprise Airport, TX</location>\n\t<station_id>KDTO</station_id>\n\t<latitude>33.20505</latitude>\n\t<longitude>-97.20061</longitude>\n\t<observation_time>Last Updated on Mar 26 2020, 1:53 pm CDT</observation_time>\r\n        <observation_time_rfc822>Thu, 26 Mar 2020 13:53:00 -0500</observation_time_rfc822>\n\t<weather>Fair</weather>\n\t<temperature_string>86.0 F (30.0 C)</temperature_string>\r\n\t<temp_f>86.0</temp_f>\r\n\t<temp_c>30.0</temp_c>\n\t<relative_humidity>51</relative_humidity>\n\t<wind_string>South at 15.0 MPH (13 KT)</wind_string>\n\t<wind_dir>South</wind_dir>\n\t<wind_degrees>170</wind_degrees>\n\t<wind_mph>15.0</wind_mph>\n\t<wind_kt>13</wind_kt>\n\t<pressure_string>1006.9 mb</pressure_string>\n\t<pressure_mb>1006.9</pressure_mb>\n\t<pressure_in>29.76</pressure_in>\n\t<dewpoint_string>66.0 F (18.9 C)</dewpoint_string>\r\n\t<dewpoint_f>66.0</dewpoint_f>\r\n\t<dewpoint_c>18.9</dewpoint_c>\n\t<heat_index_string>88 F (31 C)</heat_index_string>\r\n      \t<heat_index_f>88</heat_index_f>\r\n      \t<heat_index_c>31</heat_index_c>\n\t<visibility_mi>10.00</visibility_mi>\n \t<icon_url_base>http://forecast.weather.gov/images/wtf/small/</icon_url_base>\n\t<two_day_history_url>http://www.weather.gov/data/obhistory/KDTO.html</two_day_history_url>\n\t<icon_url_name>skc.png</icon_url_name>\n\t<ob_url>http://www.weather.gov/data/METAR/KDTO.1.txt</ob_url>\n\t<disclaimer_url>http://weather.gov/disclaimer.html</disclaimer_url>\r\n\t<copyright_url>http://weather.gov/disclaimer.html</copyright_url>\r\n\t<privacy_policy_url>http://weather.gov/notice.html</privacy_policy_url>\r\n</current_observation>\n",
        headers: [
          {"Server", "Apache"},
          {"X-NIDS-ServerID", "www7.mo"},
          {"Strict-Transport-Security", "max-age=31536000; includeSubdomains; preload;"},
          {"Last-Modified", "Thu, 26 Mar 2020 19:02:17 GMT"},
          {"Accept-Ranges", "bytes"},
          {"Content-Length", "2278"},
          {"Access-Control-Allow-Origin", "*"},
          {"Content-Type", "application/xml"},
          {"Date", "Thu, 26 Mar 2020 19:19:49 GMT"},
          {"Connection", "keep-alive"}
        ],
        request: %HTTPoison.Request{
          body: "",
          headers: [],
          method: :get,
          options: [],
          params: %{},
          url: "https://w1.weather.gov//xml/current_obs/KDTO.xml"
        },
        request_url: "https://w1.weather.gov//xml/current_obs/KDTO.xml",
        status_code: 200
      }
    }
  end
end
