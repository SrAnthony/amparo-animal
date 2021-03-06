defmodule AmparoWeb.Router do
  use AmparoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AmparoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", AnimalController, :index
    get "/animals/auto_create", AnimalController, :auto_create
    resources "/animals", AnimalController
    resources "/donators", DonatorController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AmparoWeb do
  #   pipe_through :api
  # end
end
