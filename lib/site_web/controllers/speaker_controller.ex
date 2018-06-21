defmodule SiteWeb.SpeakerController do
  use SiteWeb, :controller

  alias Site.Talks

  def index(conn, _params) do
    speakers = Talks.all_speakers()
    render(conn, "index.html", year: 2018, speakers: speakers)
  end

  def show(conn, %{"id" => slug}) do
    %{speaker: speaker, talks: talks} = Talks.speaker_info(slug)

    IO.inspect(talks)

    render(conn, "show.html", year: 2018, speaker: speaker, talks: talks)
  end
end
