defmodule IdolJpopFancoverMx.Repo.Migrations.CreaUsuario do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nombre, :string
      add :email, :string
      
      timestamps
    end
    
    create index(:usuarios, [:email], unique: true)
  end
end
