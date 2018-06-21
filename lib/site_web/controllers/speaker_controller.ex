defmodule SiteWeb.SpeakerController do
  use SiteWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", year: 2018)
  end

  def show(conn, %{"id" => slug}) do
    render(conn, "show.html", year: 2018)
  end
end
