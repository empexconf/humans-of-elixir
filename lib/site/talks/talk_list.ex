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
    |> Enum.map(&from_row/1)
  end

  defp from_row(row) do
    [
      event,
      title,
      slug,
      youtube,
      description,
      speaker_name,
      speaker_slug,
      speaker_company,
      speaker_bio,
      speaker_twitter
    ] = row

    %Talk{
      title: title,
      slug: slug,
      youtube: youtube,
      description: description,
      event: EventList.event(event),
      speakers:
        make_speakers(speaker_name, speaker_slug, speaker_company, speaker_bio, speaker_twitter)
    }
  end

  defp make_speakers(
         name,
         slug,
         company,
         bio,
         twitter
       ) do
    name = parse_speaker_data(name)
    company = parse_speaker_data(company)
    slug = parse_speaker_data(slug)
    bio = parse_speaker_data(bio)
    twitter = parse_speaker_data(twitter)

    [name, company, slug, bio, twitter]
    |> Enum.zip()
    |> Enum.map(fn {name, company, slug, bio, twitter} ->
      Speaker.new(
        name: name,
        company: company,
        slug: slug,
        bio: bio,
        twitter: twitter
      )
    end)
  end

  defp parse_speaker_data(data) do
    data
    |> case do
      "[\"" <> _ ->
        {list, _} = Code.eval_string(data)
        list

      _ ->
        [data]
    end
  end
end
