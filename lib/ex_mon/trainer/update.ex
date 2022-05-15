defmodule ExMon.Trainer.Update do
  alias ExMon.{Trainer, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case ExMon.fetch_trainer(uuid) do
       {:error, reason} -> {:error, reason}
       {:ok, trainer} -> update_trainer(trainer, params)
    end
  end

  defp update_trainer(trainer, params) do
    trainer
    |> Trainer.changeset(params)
    |> Repo.update
  end

end
