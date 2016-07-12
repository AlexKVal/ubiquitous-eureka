defmodule Tut.Router do
  use Tut.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tut do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController
    #
    # it unfolds to the set of routes:
    #
    # user_path  GET     /users             Tut.UserController :index
    # user_path  GET     /users/:id         Tut.UserController :show
    # user_path  GET     /users/:id/edit    Tut.UserController :edit
    # user_path  GET     /users/new         Tut.UserController :new
    # user_path  POST    /users             Tut.UserController :create
    # user_path  PATCH   /users/:id         Tut.UserController :update
    #            PUT     /users/:id         Tut.UserController :update
    # user_path  DELETE  /users/:id         Tut.UserController :delete

    resources "/posts", PostController, only: [:index, :show]
    # =>
    # post_path  GET  /posts             Tut.PostController :index
    # post_path  GET  /posts/:id         Tut.PostController :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Tut do
  #   pipe_through :api
  # end
end
