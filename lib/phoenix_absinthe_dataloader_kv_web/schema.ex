defmodule PhoenixAbsintheDataloaderKvWeb.Schema do
  use Absinthe.Schema

  import Absinthe.Resolution.Helpers

  alias PhoenixAbsintheDataloaderKvWeb.Resolvers

  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  def dataloader() do
    Dataloader.new()
    |> Dataloader.add_source(:links, PhoenixAbsintheDataloaderKv.Dataloader.data())
  end

  def context(ctx) do
    Map.put(ctx, :loader, dataloader())
  end

  object :webpage do
    field :name, non_null(:string)
    field :links, list_of(:link), resolve: dataloader(:links)
  end

  object :link do
    field :url, :string
  end

  query do
    @desc "Get all webpages"
    field :webpages, list_of(:webpage) do
      resolve(&Resolvers.list_webpages/3)
    end
  end
end
