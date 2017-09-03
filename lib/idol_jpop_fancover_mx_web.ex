defmodule IdolJpopFancoverMxWeb do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use IdolJpopFancoverMxWeb, :controller
      use IdolJpopFancoverMxWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: IdolJpopFancoverMxWeb
      
      use Guardian.Phoenix.Controller
      alias Guardian.Plug.EnsureAuthenticated
      alias Guardian.Plug.EnsurePermissions
      
      alias IdolJpopFancoverMx.Repo
      import Ecto
      import Ecto.Query

      import IdolJpopFancoverMxWeb.Router.Helpers
      import IdolJpopFancoverMxWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/idol_jpop_fancover_mx_web/templates",
        namespace: IdolJpopFancoverMxWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import IdolJpopFancoverMxWeb.Router.Helpers
      import IdolJpopFancoverMxWeb.ErrorHelpers
      import IdolJpopFancoverMxWeb.Gettext
      import IdolJpopFancoverMxWeb.ViewHelpers
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias IdolJpopFancoverMx.Repo
      import Ecto
      import Ecto.Query
      import IdolJpopFancoverMxWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
