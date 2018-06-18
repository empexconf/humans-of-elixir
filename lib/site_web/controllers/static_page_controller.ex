defmodule SiteWeb.StaticPageController do
  use SiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", year: 2018)
  end

  def la(conn, _params) do
    render(conn, "la_retreat_2018.html", year: 2018, title: "EMPEX LA Civic Hack Retreat 2018")
  end

  def show(conn, %{"city" => city, "type" => type, "year" => year}) do
    render(conn, "#{city}_#{type}_#{year}.html", year: 2018)
  end
end
