defmodule PhoenixAbsintheDataloaderKvWeb.Schema do
  use Absinthe.Schema

  import Absinthe.Resolution.Helpers

  alias PhoenixAbsintheDataloaderKvWeb.Resolvers

  # def middleware(middleware, _field, %{identifier: id})
  #     when id in [:query, :mutation, :subscription] do
  #   middleware ++ [OneWeb.Schema.Middleware.ErrorHandling]
  # end

  def middleware(middleware, _field, _object) do
    middleware ++ [OneWeb.Schema.Middleware.ErrorHandling]
  end

  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  def dataloader() do
    Dataloader.new(get_policy: :tuples)
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
