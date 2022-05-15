defmodule ExMon.Trainer.Delete do
  alias ExMon.{ Repo}

  def call(id) do
    case ExMon.fetch_trainer(id) do
       {:error, reason} -> {:error, reason}
       {:ok, trainer} -> delete_trainer(trainer)
    end
  end

  defp delete_trainer(trainer), do: Repo.delete(trainer)

end
