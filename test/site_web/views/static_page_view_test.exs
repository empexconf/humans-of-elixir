defmodule SiteWeb.StaticPageViewTest do
  use SiteWeb.ConnCase, async: true

  alias SiteWeb.StaticPageView

  test "tweet_link_to makes twitter links" do
    assert(
      StaticPageView.tweet_link_to("Tweet Me", url: "http://empex.co", text: "Test 123") ==
        Phoenix.HTML.Link.link(
          "Tweet Me",
          to: "https://twitter.com/intent/tweet?url=http%3A%2F%2Fempex.co&text=Test+123",
          target: "_blank"
        )
    )
  end
end
