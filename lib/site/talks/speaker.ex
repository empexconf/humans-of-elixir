defmodule Site.Talks.Speaker do
  alias __MODULE__

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

  @spec new(
          name: String.t(),
          company: String.t(),
          slug: String.t(),
          twitter: String.t(),
          bio: String.t()
        ) :: t
  def new(args) do
    struct!(Speaker, args)
  end
end
