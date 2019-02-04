# Phoenix Absinthe Dataloader.KV

## Start application
```elixir
  mix ecto.drop
  mix ecto.create
  mix ecto.migrate
  mix run priv/repo/seeds.exs
```

Open browser with this uri: http://localhost:4000/graphiql
```
query {
  webpages {
    name
    links {
      url
    }
  }
}
```
