defmodule SiteWeb.EventController do
  use SiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", year: 2019)
  end

  def la(conn, _params) do
    render(conn, "2019_la_conference.html", year: 2019, title: "EMPEX LA 2019")
  end

  def nyc(conn, _params) do
    render(conn, "2018_nyc_conference.html", year: 2018, title: "EMPEX NYC 2018")
  end

  def show(conn, %{"id" => slug}) do
    [city, type, year] = String.split(slug, "-")
    render(conn, "#{year}_#{city}_#{type}.html", year: year)
  end
end
