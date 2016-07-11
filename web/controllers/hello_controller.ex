defmodule Tut.HelloController do
  use Tut.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
