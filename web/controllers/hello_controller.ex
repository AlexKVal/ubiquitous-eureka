defmodule Tut.HelloController do
  use Tut.Web, :controller

  plug :assign_defvalue, "some_default_option" when action in [:index]

  def index(conn, _params) do
    conn
    |> assign(:name, "John Doe")
    |> render("index.html", message: "A message from Page controller")
  end

  def show(conn, %{"messenger" => value}) do
    conn
    |> put_layout(false)
    |> render "show.html", messenger: value
  end

  defp assign_defvalue(conn, value) do
    assign(conn, :defvalue, value)
  end
end
