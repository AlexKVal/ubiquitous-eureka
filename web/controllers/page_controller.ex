defmodule Tut.PageController do
  use Tut.Web, :controller

  def index(conn, _params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Kinda we have an error.")
    |> render("index.html")
  end

  def show(conn, %{"id" => id}) do
    text conn, "Just id = #{id}"
  end

  def show_json(conn, %{"id" => id}) do
    json conn, %{id: id, some: :data, text_data: "some text", num: 32}
  end

  def show_html(conn, %{"id" => id}) do
    html conn, """
    <html>
      <head>
        <title>Passing an Id</title>
      </head>
      <body>
        <p>id = #{id}</p>
      </body>
    </html>
    """
  end
end
