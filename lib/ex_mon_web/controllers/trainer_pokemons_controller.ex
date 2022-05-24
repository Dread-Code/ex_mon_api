defmodule ExMonWeb.TrainerPokemonsController do
  use ExMonWeb, :controller
  require Logger


  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer_pokemon
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> ExMon.fetch_trainer_pokemon
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({ :ok, pokemon }, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
 end

  defp handle_response({:error, message}, _conn, _view, _status), do: {:error, message, 400, "error"}
end
