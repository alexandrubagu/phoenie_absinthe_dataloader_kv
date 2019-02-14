defmodule PhoenixAbsintheDataloaderKv.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixAbsintheDataloaderKv.Webpage

  schema "links" do
    field :url, :string
    belongs_to :webpage, Webpage
    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
