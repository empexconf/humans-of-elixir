defmodule Site.Talks do
  alias Site.Talks.Event
  alias Site.Talks.Speaker
  alias Site.Talks.Talk
  alias Site.Talks.TalkList

  @all_talks TalkList.all()

  @spec talk(String.t()) :: Talk.t()
  def talk(slug) do
    @all_talks
    |> Talk.find(slug)
  end

  @spec all_talks() :: [Talk.t()]
  def all_talks() do
    @all_talks
  end

  @spec speaker_info(speaker_slug :: String.t()) :: %{talks: [Talk.t()], speaker: Speaker.t()}
  def speaker_info(speaker_slug) do
    talks = Talk.talks_for_speaker(@all_talks, speaker_slug)

    speaker =
      all_speakers()
      |> Enum.find(fn speaker -> speaker.slug == speaker_slug end)

    %{talks: talks, speaker: speaker}
  end

  @spec all_speakers() :: [Talk.t()]
  def all_speakers() do
    @all_talks
    |> Talk.speakers()
  end

  @spec group_by_event(talks :: [Talk.t()]) :: [{Event.t(), Talk.t()}]
  def group_by_event(talks) do
    talks
    |> Enum.group_by(fn talk -> talk.event end)
    |> Enum.sort_by(fn {event, _talks} ->
      event.date
    end)
    |> Enum.reverse()
  end
end
