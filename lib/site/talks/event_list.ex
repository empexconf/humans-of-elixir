defmodule Site.Talks.EventList do
  @moduledoc """
  Data on events, to be tied to a Talk.
  """

  alias Site.Talks.Event

  @spec event(slug :: String.t) :: Event.t()
  def event("la_conference_2019") do
    %Event{
      date: "February 2, 2019",
      location: "Los Angeles"
    }
  end

  def event("la_conference_2018") do
    %Event{
      date: "February 10, 2018",
      location: "Los Angeles"
    }
  end

  def event("nyc_conference_2018") do
    %Event{
      date: "May 17, 2018",
      location: "New York City"
    }
  end
end
