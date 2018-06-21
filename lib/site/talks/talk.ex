defmodule Site.Talks.Talk do
  alias __MODULE__

  @type t :: %Talk{
          title: String.t(),
          slug: String.t(),
          youtube: String.t(),
          date: String.t(),
          location: String.t(),
          description: String.t(),
          speaker_name: String.t(),
          speaker_company: String.t(),
          speaker_slug: String.t(),
          speaker_twitter: String.t(),
          speaker_bio: String.t()
        }

  defstruct [
    :title,
    :slug,
    :youtube,
    :date,
    :location,
    :description,
    :speaker_name,
    :speaker_company,
    :speaker_slug,
    :speaker_twitter,
    :speaker_bio
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

  @spec latest_talk_for_each_speaker([t]) :: [t]
  def latest_talk_for_each_speaker(talks) do
    talks
    |> Enum.uniq_by(fn %Talk{speaker_slug: speaker_slug} -> speaker_slug end)
  end

  @spec youtube_link(Talk.t()) :: String.t()
  def youtube_link(%Talk{youtube: youtube}) do
    "https://youtu.be/#{youtube}"
  end

  @spec talk_belongs_to_speaker(t, String.t()) :: boolean
  defp talk_belongs_to_speaker(%Talk{speaker_slug: speaker_slug}, speaker_slug), do: true
  defp talk_belongs_to_speaker(_talk, _speaker_slug), do: false
end
