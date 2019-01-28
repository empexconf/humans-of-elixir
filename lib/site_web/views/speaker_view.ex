defmodule SiteWeb.SpeakerView do
  use SiteWeb, :view

  alias __MODULE__
  alias SiteWeb.TalkView

  def summary_data(speaker) do
    company =
      if speaker.company != "" do
        content_tag(:span, speaker.company)
      else
        nil
      end

    twitter =
      if speaker.twitter != "" do
        link("@#{speaker.twitter}", to: "https://twitter.com/#{speaker.twitter}", target: "_blank")
      else
        nil
      end

    body =
      [company, twitter]
      |> Enum.reject(fn value -> value == nil end)

    content_tag(:div, class: "speaker__info") do
      body
    end
  end
end
