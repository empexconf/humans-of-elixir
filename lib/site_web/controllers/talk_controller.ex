defmodule SiteWeb.TalkController do
  use SiteWeb, :controller

  alias Site.Talks

  def index(conn, _params) do
    talks = Talks.all_talks()

    render(conn, "index.html", year: 2018, talks: talks)
  end

  def show(conn, %{"id" => slug}) do
    talk = Talks.talk(slug)

    render(conn, "show.html", year: 2018, talk: talk)
  end
end
