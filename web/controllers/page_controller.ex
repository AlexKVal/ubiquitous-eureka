defmodule Tut.PageController do
  use Tut.Web, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Kinda we have an error.")
    |> render("index.html")
  end
end
