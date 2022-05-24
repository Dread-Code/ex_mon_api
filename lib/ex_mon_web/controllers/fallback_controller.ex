defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  def call(conn, {:error, message, status}) do
    conn
    |> put_status(status[:status])
    |> put_view(ExMonWeb.ErrorView)
    |> render("error.json", result: message)
  end
end
