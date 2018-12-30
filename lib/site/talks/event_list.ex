defmodule Site.Talks.EventList do
  @moduledoc """
  Data on events, to be tied to a Talk.
  """

  alias Site.Talks.Event

  @spec la_conference_2018() :: Event.t()
  def la_conference_2018 do
    %Event{
      date: "February 2, 2018",
      location: "Los Angeles"
    }
  end

  @spec nyc_conference_2018() :: Event.t()
  def nyc_conference_2018 do
    %Event{
      date: "May 17, 2018",
      location: "New York City"
    }
  end
end
