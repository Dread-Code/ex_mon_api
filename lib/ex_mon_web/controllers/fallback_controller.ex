defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller
  require Logger

  def call(conn, {:error, message, status, view}) do
    Logger.info(message)
    Logger.info("sasdfasfafsf")
    conn
    |> put_status(status)
    |> put_view(ExMonWeb.ErrorView)
    |> render("#{view}.json", result: message)
  end
end
