defmodule PhoenixAbsintheDataloaderKvWeb.Router do
  use PhoenixAbsintheDataloaderKvWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: PhoenixAbsintheDataloaderKvWeb.Schema,
    json_codec: Jason,
    default_url: "/api"

  scope "/api" do
    pipe_through :api
    forward "/", Absinthe.Plug, schema: PhoenixAbsintheDataloaderKvWeb.Schema, json_codec: Jason
  end
end
