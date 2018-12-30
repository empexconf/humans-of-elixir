defmodule Site.Talks.Event do
  @type t :: %__MODULE__{
          name: String.t(),
          date: String.t(),
          location: String.t()
        }

  defstruct [:name, :date, :location]
end
