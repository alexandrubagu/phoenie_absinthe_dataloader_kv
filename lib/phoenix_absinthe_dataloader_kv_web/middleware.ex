defmodule OneWeb.Schema.Middleware.ErrorHandling do
  @moduledoc """
  Changeset Error handling middleware for Absinthe
  """
  @behaviour Absinthe.Middleware

  require Logger

  def call(resolution, _) do
    resolution =
      case resolution.value do
        {:error, reason} ->
          %{resolution | errors: [reason | resolution.errors], value: nil}

        {:ok, values} when is_list(values) ->
          resolution =
            Enum.reduce(values, %{resolution | value: []}, fn
              {:error, reason}, acc ->
                %{acc | errors: [reason | acc.errors], values: [nil | acc.value]}

              {:ok, value}, acc ->
                %{acc | value: [value | acc.value]}

              value, acc ->
                %{acc | value: [value | acc.value]}
            end)
            |> IO.inspect()

          %{resolution | value: Enum.reverse(resolution.value)}

        _ ->
          resolution
      end

    %{resolution | errors: Enum.reverse(resolution.errors)}
  end
end
