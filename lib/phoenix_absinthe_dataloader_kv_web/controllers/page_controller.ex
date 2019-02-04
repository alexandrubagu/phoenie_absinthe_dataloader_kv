defmodule PhoenixAbsintheDataloaderKvWeb.PageController do
  use PhoenixAbsintheDataloaderKvWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
