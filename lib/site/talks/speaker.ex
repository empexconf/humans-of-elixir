defmodule Site.Talks.Speaker do
  alias __MODULE__
  alias Site.Talks.Talk

  @type t :: %Speaker{
          name: String.t(),
          company: String.t(),
          slug: String.t(),
          twitter: String.t(),
          bio: String.t()
        }

  defstruct [
    :name,
    :company,
    :slug,
    :twitter,
    :bio
  ]

  @spec from_talk(Talk.t()) :: t
  def from_talk(%Talk{
        speaker_name: name,
        speaker_company: company,
        speaker_slug: slug,
        speaker_twitter: twitter,
        speaker_bio: bio
      }) do
    %Speaker{
      name: name,
      company: company,
      slug: slug,
      twitter: twitter,
      bio: bio
    }
  end
end
