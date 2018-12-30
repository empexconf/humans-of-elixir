defmodule Site.Talks do
  alias Site.Talks.Talk
  alias Site.Talks.TalkList
  alias Site.Talks.Speaker

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

  @spec speaker_info(String.t()) :: %{talks: [Talk.t()], speaker: Speaker.t()}
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
end
