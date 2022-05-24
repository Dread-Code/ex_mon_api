defmodule ExMon.Trainer.Pokemon.Update do
  alias ExMon.{Trainer.Pokemon, Repo}

  def call(%{"id" => uuid} = params) do
    case ExMon.fetch_trainer_pokemon(uuid) do
       {:error, reason} -> {:error, reason}
       {:ok, pokemon} -> update_pokemon(pokemon, params)
    end
  end

  defp update_pokemon(pokemon, params) do
    pokemon
    |> Pokemon.update_changeset(params)
    |> Repo.update
  end

end
