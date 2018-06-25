defmodule Amparo.Repo.Migrations.CreateDonators do
  use Ecto.Migration

  def change do
    create table(:donators) do
      add :name, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :phone, :string
      add :obs, :text
      add :birthday, :date

      timestamps()
    end

  end
end
