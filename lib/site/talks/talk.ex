defmodule Site.Talks.Talk do
  alias __MODULE__
  alias Site.Talks.Event

  @type t :: %Talk{
          title: String.t(),
          slug: String.t(),
          youtube: String.t(),
          description: String.t(),
          event: Event.t(),
          speakers: [Speaker.t()]
        }

  defstruct [
    :title,
    :slug,
    # Just the YouTube slug, like NKJFL9LpP4M
    :youtube,
    :description,
    :event,
    :speakers
  ]

  @spec find([t], String.t()) :: t
  def find(talks, slug) do
    talks
    |> Enum.find(fn %Talk{slug: talk_slug} ->
      talk_slug == slug
    end)
  end

  @spec talks_for_speaker([t], String.t()) :: [t]
  def talks_for_speaker(talks, speaker_slug) do
    talks
    |> Enum.filter(&talk_belongs_to_speaker(&1, speaker_slug))
  end

  def speakers(talks) do
    talks
    |> Enum.flat_map(fn talk -> talk.speakers end)
    |> Enum.uniq()
  end

  @spec youtube_link(Talk.t()) :: String.t()
  def youtube_link(%Talk{youtube: youtube}) do
    "https://youtu.be/#{youtube}"
  end

  @spec talk_belongs_to_speaker(t, String.t()) :: boolean
  defp talk_belongs_to_speaker(%Talk{speakers: speakers}, speaker_slug) do
    speakers
    |> Enum.any?(fn speaker ->
      speaker.slug == speaker_slug
    end)
  end
end
