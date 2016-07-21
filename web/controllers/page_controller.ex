defmodule Tut.PageController do
  use Tut.Web, :controller

  def index(conn, params) do
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Kinda we have an error.")
    |> put_status(:accepted) # 202
    |> render(:index, message: params["message"])
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

  def redirect_page(conn, _params) do
    redirect conn, to: "/redirect_test"

    # or by using a path helper
    # redirect conn, to: redirect_test_path(conn, :redirect_test)

    # but a url helper will fail
    # redirect conn, to: redirect_test_url(conn, :redirect_test)
    # but it can be done like that
    # redirect conn, external: redirect_test_url(conn, :redirect_test)
  end

  def redirect_test(conn, _params) do
    text conn, "It is redirected! Yeah :)"
  end

  def test(conn, _params) do
    render conn, "test.html"
  end
end
