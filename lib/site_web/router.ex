defmodule SiteWeb.Router do
  use SiteWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", SiteWeb do
    # Use the default browser stack
    pipe_through(:browser)

    resources("/", HomepageController, only: [:index])
    get("/la", EventController, :la)
    get("/nyc", EventController, :nyc)
    resources("/events", EventController, only: [:index, :show])
    resources("/talks", TalkController, only: [:index, :show])
    resources("/speakers", SpeakerController, only: [:index, :show])
  end
end
