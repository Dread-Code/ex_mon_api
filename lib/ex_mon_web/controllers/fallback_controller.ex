defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(ExMonWeb.ErrorView)
    |> render("401.json", message: "Trainer unauthorized")
  end

  def call(conn, {:error, message, status, view}) do
    conn
    |> put_status(status)
    |> put_view(ExMonWeb.ErrorView)
    |> render("#{view}.json", result: message)
  end

end
