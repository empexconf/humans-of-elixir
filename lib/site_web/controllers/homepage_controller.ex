defmodule SiteWeb.HomepageController do
  use SiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", year: 2018)
  end
end
