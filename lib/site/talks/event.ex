defmodule Site.Talks.Event do
  @type t :: %__MODULE__{
          date: String.t(),
          location: String.t()
        }

  defstruct [:date, :location]
end
