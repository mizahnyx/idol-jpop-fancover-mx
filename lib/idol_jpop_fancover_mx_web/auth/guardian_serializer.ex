defmodule IdolJpopFancoverMxWeb.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias IdolJpopFancoverMx.Repo
  alias IdolJpopFancoverMxWeb.Usuario

  def for_token(usuario = %Usuario{}), do: { :ok, "Usuario:#{usuario.id}" }
  def for_token(_), do: { :error, "Tipo de recurso desconocido" }

  def from_token("Usuario:" <> id), do: { :ok, Repo.get(Usuario, id) }
  def from_token(_), do: { :error, "Tipo de recurso desconocido" }

end