defmodule PhoenixAbsintheDataloaderKvWeb.Resolvers do
  alias PhoenixAbsintheDataloaderKv.Core

  def list_webpages(_parent, _args, _resolution) do
    {:ok, Core.list_webpages()}
  end

  def get_link(%{id: webpage_id}, _args, _resolution) do
    {:ok, Core.get_links(webpage_id)}
  end
end
