defmodule SiteWeb.EventController do
  use SiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", year: 2018)
  end

  def la(conn, _params) do
    render(conn, "2018_la_retreat.html", year: 2018, title: "EMPEX LA Civic Hack Retreat 2018")
  end

  def show(conn, %{"id" => slug}) do
    [city, type, year] = String.split(slug, "-")
    render(conn, "#{year}_#{city}_#{type}.html", year: year)
  end
end
