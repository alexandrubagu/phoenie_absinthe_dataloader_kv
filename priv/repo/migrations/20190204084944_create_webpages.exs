defmodule PhoenixAbsintheDataloaderKv.Repo.Migrations.CreateWebpages do
  use Ecto.Migration

  def change do
    create table(:webpages) do
      add(:name, :string)

      timestamps()
    end
  end
end
