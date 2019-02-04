defmodule DataloadKv.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :webpage_id, :id
      timestamps()
    end
  end
end
