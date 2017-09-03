defmodule IdolJpopFancoverMxWeb.Router do
  use IdolJpopFancoverMxWeb, :router

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
  
  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  scope "/", IdolJpopFancoverMxWeb do
    pipe_through [:browser, :browser_auth] # Use the default browser stack

    get "/", PageController, :index
    delete "/logout", AuthController, :logout
    get "/credentials", AuthController, :credentials
    get "/signup", SignupController, :new  end
  
  # Other scopes may use custom stacks.
  # scope "/api", IdolJpopFancoverMx do
  #   pipe_through :api
  # end
  
  scope "/auth", IdolJpopFancoverMxWeb do
    pipe_through [:browser, :browser_auth]
    
    get "/:identity", AuthController, :login
    get "/:identity/callback", AuthController, :callback
    post "/:identity/callback", AuthController, :callback
  end
end
