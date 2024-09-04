
defmodule IncrementServiceWeb.Router do
  use IncrementServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", IncrementServiceWeb do
    pipe_through :api

    post "/increment", IncrementController, :increment
  end
end
    