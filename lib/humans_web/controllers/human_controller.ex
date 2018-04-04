defmodule HumansWeb.HumanController do
  use HumansWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => name}) do
    render(conn, "show.html", name: name)
  end
end
