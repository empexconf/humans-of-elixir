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

    get("/", StaticPageController, :index)
    get("/la", StaticPageController, :la)
    get("/:city/:type/:year", StaticPageController, :show)
  end

  # Other scopes may use custom stacks.
  # scope "/api", SiteWeb do
  #   pipe_through :api
  # end
end
