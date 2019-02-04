defmodule PhoenixAbsintheDataloaderKv.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_absinthe_dataloader_kv,
    adapter: Ecto.Adapters.Postgres
end
