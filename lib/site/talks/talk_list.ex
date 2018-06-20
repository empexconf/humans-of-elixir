defmodule Site.Talks.TalkList do
  alias Site.Talks.Talk

  @spec all() :: Talk.t()
  def all do
    [
      %Talk{
        title: "Ants",
        youtube: "",
        date: "2018-02-03",
        location: "la",
        description: "",
        speaker_name: "Will Ockelmann-Wagner",
        speaker_company: "Carbon Five",
        speaker_slug: "will-wow",
        speaker_twitter: "WowItsWillWow"
      }
    ]
  end
end
