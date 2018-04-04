defmodule HumansWeb.Router do
  use HumansWeb, :router

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

  scope "/", HumansWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", HumanController, :index)
    resources("/humans", HumanController, [:index, :show])
  end

  # Other scopes may use custom stacks.
  # scope "/api", HumansWeb do
  #   pipe_through :api
  # end
end
