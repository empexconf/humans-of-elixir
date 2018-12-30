defmodule Site.Talks.EventList do
  @moduledoc """
  Data on events, to be tied to a Talk.
  """

  alias Site.Talks.Event

  @spec event(slug :: String.t) :: Event.t()
  def event("la_conference_2019") do
    %Event{
      name: "2019 EMPEX Los Angeles",
      date: "2019-02-02",
      location: "Los Angeles"
    }
  end

  def event("la_conference_2018") do
    %Event{
      name: "2018 EMPEX Los Angeles",
      date: "2018-02-10",
      location: "Los Angeles"
    }
  end

  def event("nyc_conference_2018") do
    %Event{
      name: "2018 EMPEX Los Angeles",
      date: "2018-05-17",
      location: "New York City"
    }
  end
end
