defmodule Inmana.Repo.Migrations.CreateSupplyTable do
  use Ecto.Migration

  def change do
    create table(:supplies) do
      add :description, :string
      add :expires_at, :date
      add :responsible, :string
      add :restaurant_id, references(:restaurants, type: :binary_id)

      timestamps()
    end
  end
end
