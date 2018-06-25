defmodule Amparo.Donation.Animal do
  use Ecto.Schema
  import Ecto.Changeset


  schema "animals" do
    field :adoption_date, :date
    field :age, :integer
    field :breed, :string
    field :city, :string
    field :name, :string
    field :obs, :string

    timestamps()
  end

  @doc false
  def changeset(animal, attrs) do
    animal
    |> cast(attrs, [:name, :breed, :age, :city, :adoption_date, :obs])
    |> validate_required([:name, :breed, :age, :city, :adoption_date, :obs])
  end
end
