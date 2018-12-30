defmodule SiteWeb.ViewHelpers do
  use Phoenix.HTML

  @spec tweet_link_to(String.t(), keyword(String.t())) :: any
  def tweet_link_to(text, params) do
    query = URI.encode_query(params)

    uri =
      "https://twitter.com/intent/tweet"
      |> URI.parse()
      |> URI.merge("?#{query}")
      |> URI.to_string()

    link(text, to: uri, target: "_blank")
  end
end
