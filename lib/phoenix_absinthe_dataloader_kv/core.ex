defmodule PhoenixAbsintheDataloaderKv.Core do
  import Ecto.Query

  alias PhoenixAbsintheDataloaderKv.Repo
  alias PhoenixAbsintheDataloaderKv.{Webpage, Link}

  def list_webpages do
    Repo.all(Webpage)
  end

  def get_links(webpage_id) do
    query =
      from l in Link,
        where: l.webpage_id == ^webpage_id

    Repo.all(query)
  end
end
