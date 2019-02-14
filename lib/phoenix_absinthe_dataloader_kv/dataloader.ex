defmodule PhoenixAbsintheDataloaderKv.Dataloader do
  import Ecto.Query
  alias PhoenixAbsintheDataloaderKv.Repo
  alias PhoenixAbsintheDataloaderKv.Link

  def data do
    Dataloader.KV.new(&load/2)
  end

  def load(_batch_key, webpages) do
    batches =
      webpages
      |> Enum.map(& &1.id)
      |> fetch_links

    Enum.reduce(webpages, %{}, fn webpage, acc ->
      Map.put(acc, webpage, {:error, "my_reason"})
    end)
  end

  def fetch_links(webpage_ids) do
    query =
      from l in Link,
        where: l.webpage_id in ^webpage_ids,
        select: l

    query
    |> Repo.all()
    |> Enum.group_by(& &1.webpage_id)
  end
end
