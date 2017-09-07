defmodule IdolJpopFancoverMxWeb.Usuario do
  use IdolJpopFancoverMxWeb, :model

  schema "usuarios" do
    field :nombre, :string
    field :email, :string
    field :avatar, :string

    has_many :autorizaciones, IdolJpopFancoverMxWeb.Autorizacion

    timestamps()
  end

  @required_fields ~w(nombre email)
  @optional_fields ~w(avatar)

  def registration_changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(email nombre), ~w(avatar))
  end

  @doc """
  Creates a changeset based on the `model` and `params`.
  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/@/)
  end
end