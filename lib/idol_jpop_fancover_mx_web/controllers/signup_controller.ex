defmodule IdolJpopFancoverMxWeb.SignupController do
  use IdolJpopFancoverMxWeb, :controller
  
  alias IdolJpopFancoverMxWeb.Usuario

  def new(conn, params, current_user, _claims) do
    render conn, "new.html", current_user: current_user
  end
end