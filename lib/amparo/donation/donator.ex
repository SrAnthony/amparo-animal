defmodule Amparo.Donation.Donator do
  use Ecto.Schema
  import Ecto.Changeset


  schema "donators" do
    field :address, :string
    field :birthday, :date
    field :city, :string
    field :name, :string
    field :obs, :string
    field :phone, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(donator, attrs) do
    donator
    |> cast(attrs, [:name, :address, :city, :state, :phone, :obs, :birthday])
    |> validate_required([:name, :address, :city, :state, :phone, :obs, :birthday])
  end
end
