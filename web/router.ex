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

    # nested routes
    # "user" one-to-many "posts"
    # resources "/users", UserController do
    #   resources "/posts", PostController
    # end
    #
    # user_post_path  GET     /users/:user_id/posts           Tut.PostController :index
    # user_post_path  GET     /users/:user_id/posts/:id/edit  Tut.PostController :edit
    # user_post_path  GET     /users/:user_id/posts/new       Tut.PostController :new
    # user_post_path  GET     /users/:user_id/posts/:id       Tut.PostController :show
    # user_post_path  POST    /users/:user_id/posts           Tut.PostController :create
    # user_post_path  PATCH   /users/:user_id/posts/:id       Tut.PostController :update
    #                 PUT     /users/:user_id/posts/:id       Tut.PostController :update
    # user_post_path  DELETE  /users/:user_id/posts/:id       Tut.PostController :delete
    #
    # iex(1)> import Tut.Router.Helpers
    # Tut.Router.Helpers
    # iex(2)> alias Tut.Endpoint
    # Tut.Endpoint
    # iex(3)> user_post_path Endpoint, :show, 42, 17
    # "/users/42/posts/17"
    #
    # iex(4)> user_post_path Endpoint, :index, 42, active: true
    # "/users/42/posts?active=true"


    # resources "/users", UserController
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

    # resources "/posts", PostController, only: [:index, :show]
    # =>
    # post_path  GET  /posts             Tut.PostController :index
    # post_path  GET  /posts/:id         Tut.PostController :show

    resources "/reviews", ReviewController
    # review_path  GET  /reviews  Tut.ReviewController :index
  end

  scope "/admin", Tut.Admin, as: :admin do
    pipe_through :browser

    resources "/users",   UserController
    resources "/reviews", ReviewController
  end
  #
  # admin_review_path  GET  /admin/reviews  Tut.Admin.ReviewController :index


  # Other scopes may use custom stacks.
  # scope "/api", Tut do
  #   pipe_through :api
  # end
end
