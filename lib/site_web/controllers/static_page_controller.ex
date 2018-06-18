defmodule SiteWeb.StaticPageController do
  use SiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def la(conn, _params) do
    render(conn, "la_retreat_2018.html")
  end

  def show(conn, %{"city" => city, "type" => type, "year" => year}) do
    render(conn, "#{city}_#{type}_#{year}.html")
  end
end
