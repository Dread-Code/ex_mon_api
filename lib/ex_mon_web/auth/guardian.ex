defmodule ExMonWeb.Auth.Guardian do
  use Guardian, otp_app: :ex_mon

  alias ExMon.Trainer

  def subject_for_token(trainer, _claims) do
    # You can use any value for the subject of your token but
    # it should be useful in retrieving the resource later, see
    # how it being used on `resource_from_claims/1` function.
    # A unique `id` is a good subject, a non-unique email address
    # is a poor subject.
    sub = to_string(trainer.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> ExMon.fetch_trainer
  end

  def authenticate(%{"id" => trainer_id, "password" => password}) do
    case ExMon.fetch_trainer(trainer_id) do
      {:ok, trainer} -> validate_password(trainer, password)
      {:error, reason} -> {:error, reason, 400, 400}
    end
  end

  defp validate_password(%Trainer{password_hash: hash} = trainer, password) do
    case Argon2.verify_pass(password, hash) do
      true -> create_token(trainer)
      false -> {:error, :unauthorized}
    end
  end

  defp create_token(trainer) do
    {:ok, token, _clains} = encode_and_sign(trainer)
    {:ok, token}
  end

end
