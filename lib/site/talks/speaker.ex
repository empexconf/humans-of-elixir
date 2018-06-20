defmodule Site.Talks.Speaker do
  alias __MODULE__
  alias Site.Talks.Talk

  @type t :: %Speaker{
          name: String.t(),
          company: String.t(),
          slug: String.t(),
          twitter: String.t()
        }

  defstruct [
    :name,
    :company,
    :slug,
    :twitter
  ]

  @spec from_talk(Talk.t()) :: t
  def from_talk(%Talk{
        speaker_name: name,
        speaker_company: company,
        speaker_slug: slug,
        speaker_twitter: twitter
      }) do
    %Speaker{
      name: name,
      company: company,
      slug: slug,
      twitter: twitter
    }
  end
end
