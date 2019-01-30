NimbleCSV.define(TalkParser, separator: ",")

defmodule Site.Talks.TalkList do
  @moduledoc """
  The list of all the talks. Used to generate talk and speaker pages.
  """

  alias Site.Talks.Talk
  alias Site.Talks.EventList
  alias Site.Talks.Speaker

  @spec all() :: [Talk.t()]
  def all do
    "lib/site/talks/talks.csv"
    |> File.stream!()
    |> TalkParser.parse_stream()
    |> Enum.reduce([], &from_rows/2)
    |> Enum.reverse()
  end

  defp from_rows(row, talks) do
    IO.inspect(row)

    [
      event,
      slug,
      title,
      youtube,
      description,
      speaker_name,
      speaker_slug,
      speaker_company,
      speaker_bio,
      speaker_twitter,
      _speaker_interview
    ] = row

    last_talk =
      case talks do
        [last_talk | _] -> last_talk
        [] -> %{slug: nil}
      end

    speaker =
      Speaker.new(
        name: speaker_name,
        company: speaker_company,
        slug: speaker_slug,
        bio: speaker_bio,
        twitter: speaker_twitter
      )

    talk =
      case last_talk.slug do
        ^slug ->
          # Concat to the end, so we don't have to reverse speakers later.
          speakers = last_talk.speakers ++ [speaker]
          struct!(last_talk, speakers: speakers)

        _ ->
          %Talk{
            title: title,
            slug: slug,
            youtube: youtube,
            description: description,
            event: EventList.event(event),
            speakers: [speaker]
          }
      end

    [talk | talks]
  end
end
