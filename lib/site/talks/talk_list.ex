defmodule Site.Talks.TalkList do
  alias Site.Talks.Talk

  @spec all() :: Talk.t()
  def all do
    [
      %Talk{
        title: "A Swarm of Processes — Simulating Ant Foraging Behavior with OTP",
        slug: "swarm-of-processes",
        youtube: "NKJFL9LpP4M",
        date: "2018-02-03",
        location: "la",
        description:
          "In this talk, we'll see a simulation of a foraging ant colony that can efficiently find and collect food, built using a separate OTP process for each ant. Along the way we'll look at GenServers, DynamicSupervisors, Registries, and more OTP goodness. We’ll also learn a little bit about ants!",
        speaker_name: "Will Ockelmann-Wagner",
        speaker_company: "Carbon Five",
        speaker_slug: "will-wow",
        speaker_twitter: "WowItsWillWow",
        speaker_bio:
          "Will is a software developer at Carbon Five. He started his career in accounting, but found that automating his job away was more fun than the actual job, and moved over to software. He’s into typed functional programming and tiny keyboards."
      },
      %Talk{
        title: "Ecto.Schema without Ecto.Repo",
        slug: "Rosemary Ledesma",
        youtube: "BP-f3Kcqb1A",
        date: "2018-02-03",
        location: "la",
        description: """
        With newer versions of Ecto you can use Ecto.Schema without even importing Ecto.Repo or setting up a traditional database. Why would you wish to?

        Your microservice or other lightweight app may not use a database but you'll probably still need to wrangle some serious data: complex params, JSON request/response bodies, RabbitMQ payloads, etc. That's data that you'll need to parse, cast, and validate.

        I'll step you through how to use Ecto.Schema on its own to cast and validate various kinds of data, and how to extract the final results whether the data is valid or invalid.

        I'll also discuss some of the stumbling blocks and limitations I've encountered while leveraging Ecto.Schema in this way.
        """,
        speaker_name: "Rosemary Ledesma",
        speaker_company: "",
        speaker_slug: "rosemary-ledesma",
        speaker_bio:
          "Rosemary is passionate about writing software with Elixir and Phoenix, and works as a back-end software engineer for RentPath LLC. In her spare time she enjoys hiking, swing-dancing, and rowing (crew)."
      }
      # %Talk{
      #   title: "",
      #   slug: "",
      #   youtube: "",
      #   date: "",
      #   location: "",
      #   description: "",
      #   speaker_name: "",
      #   speaker_company: "",
      #   speaker_slug: "",
      #   speaker_twitter: "",
      #   speaker_bio: ""
      # }
    ]
  end
end
