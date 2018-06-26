defmodule Amparo.Repo.Migrations.AddFieldsToAnimals do
  use Ecto.Migration

  def change do
    alter table(:animals) do
      add :image, :string
      add :temperament, :string
      add :weight, :string
      add :height, :string
    end
  end
end
