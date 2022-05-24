defmodule ExMon.Trainer.Pokemon.Delete do
  alias ExMon.{ Repo }

  def call(id) do
    case ExMon.fetch_trainer_pokemon(id) do
       {:error, reason} -> {:error, reason}
       {:ok, trainer} -> delete_pokemon(trainer)
    end
  end

  defp delete_pokemon(trainer), do: Repo.delete(trainer)

end
