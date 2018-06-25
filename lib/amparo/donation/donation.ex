defmodule Amparo.Donation do
  @moduledoc """
  The Donation context.
  """

  import Ecto.Query, warn: false
  alias Amparo.Repo

  alias Amparo.Donation.Animal

  @doc """
  Returns the list of animals.

  ## Examples

      iex> list_animals()
      [%Animal{}, ...]

  """
  def list_animals do
    Repo.all(Animal)
  end

  @doc """
  Gets a single animal.

  Raises `Ecto.NoResultsError` if the Animal does not exist.

  ## Examples

      iex> get_animal!(123)
      %Animal{}

      iex> get_animal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_animal!(id), do: Repo.get!(Animal, id)

  @doc """
  Creates a animal.

  ## Examples

      iex> create_animal(%{field: value})
      {:ok, %Animal{}}

      iex> create_animal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_animal(attrs \\ %{}) do
    %Animal{}
    |> Animal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a animal.

  ## Examples

      iex> update_animal(animal, %{field: new_value})
      {:ok, %Animal{}}

      iex> update_animal(animal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_animal(%Animal{} = animal, attrs) do
    animal
    |> Animal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Animal.

  ## Examples

      iex> delete_animal(animal)
      {:ok, %Animal{}}

      iex> delete_animal(animal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_animal(%Animal{} = animal) do
    Repo.delete(animal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking animal changes.

  ## Examples

      iex> change_animal(animal)
      %Ecto.Changeset{source: %Animal{}}

  """
  def change_animal(%Animal{} = animal) do
    Animal.changeset(animal, %{})
  end

  alias Amparo.Donation.Donator

  @doc """
  Returns the list of donators.

  ## Examples

      iex> list_donators()
      [%Donator{}, ...]

  """
  def list_donators do
    Repo.all(Donator)
  end

  @doc """
  Gets a single donator.

  Raises `Ecto.NoResultsError` if the Donator does not exist.

  ## Examples

      iex> get_donator!(123)
      %Donator{}

      iex> get_donator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_donator!(id), do: Repo.get!(Donator, id)

  @doc """
  Creates a donator.

  ## Examples

      iex> create_donator(%{field: value})
      {:ok, %Donator{}}

      iex> create_donator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_donator(attrs \\ %{}) do
    %Donator{}
    |> Donator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a donator.

  ## Examples

      iex> update_donator(donator, %{field: new_value})
      {:ok, %Donator{}}

      iex> update_donator(donator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_donator(%Donator{} = donator, attrs) do
    donator
    |> Donator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Donator.

  ## Examples

      iex> delete_donator(donator)
      {:ok, %Donator{}}

      iex> delete_donator(donator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_donator(%Donator{} = donator) do
    Repo.delete(donator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking donator changes.

  ## Examples

      iex> change_donator(donator)
      %Ecto.Changeset{source: %Donator{}}

  """
  def change_donator(%Donator{} = donator) do
    Donator.changeset(donator, %{})
  end
end
