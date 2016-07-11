defmodule Tut.HelloController do
  use Tut.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"messenger" => value}) do
    render conn, "show.html", messenger: value
  end
end
