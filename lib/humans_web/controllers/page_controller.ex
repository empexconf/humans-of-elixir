defmodule HumansWeb.PageController do
  use HumansWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
