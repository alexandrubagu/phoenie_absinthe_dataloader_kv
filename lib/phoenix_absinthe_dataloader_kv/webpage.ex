defmodule PhoenixAbsintheDataloaderKv.Webpage do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixAbsintheDataloaderKv.Link

  schema "webpages" do
    field :name, :string
    has_many :links, Link
    timestamps()
  end

  @doc false
  def changeset(web_page, attrs) do
    web_page
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
