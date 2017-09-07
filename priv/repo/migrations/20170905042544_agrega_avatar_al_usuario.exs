defmodule IdolJpopFancoverMx.Repo.Migrations.AgregaAvatarAlUsuario do
  use Ecto.Migration

  def change do
    alter table(:usuarios) do
      add :avatar, :string
    end
  end
end
