defmodule ExMonWeb.TrainerPokemonsController do
  use ExMonWeb, :controller


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

  def delete(conn, %{"id" => id}) do
    id
    |> ExMon.delete_trainer_pokemon
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _trainer}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
 end

defp handle_delete({:error, reason}, _conn), do: {:error, reason, 400, 400}

  defp handle_response({ :ok, pokemon }, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
 end

  defp handle_response({:error, message}, _conn, _view, _status), do: {:error, message, 400, "error"}
end
