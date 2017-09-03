defmodule IdolJpopFancoverMx.Repo.Migrations.CreaAutorizacion do
  use Ecto.Migration

  def change do
  	create table(:autorizaciones) do
      add :provider, :string
      add :uid, :string
      add :token, :text
      add :refresh_token, :text
      add :expires_at, :bigint
      add :usuario_id, references(:usuarios, on_delete: :delete_all)

      timestamps
    end

    create index(:autorizaciones, [:provider, :uid], unique: true)
    create index(:autorizaciones, [:expires_at])
    create index(:autorizaciones, [:provider, :token])
  end
end
