defmodule Amparo.Repo.Migrations.CreateAnimals do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :string
      add :breed, :string
      add :age, :integer
      add :city, :string
      add :adoption_date, :date
      add :obs, :text

      timestamps()
    end

  end
end
