defmodule Amparo.DonationTest do
  use Amparo.DataCase

  alias Amparo.Donation

  describe "animals" do
    alias Amparo.Donation.Animal

    @valid_attrs %{adoption_date: ~D[2010-04-17], age: 42, breed: "some breed", city: "some city", name: "some name", obs: "some obs"}
    @update_attrs %{adoption_date: ~D[2011-05-18], age: 43, breed: "some updated breed", city: "some updated city", name: "some updated name", obs: "some updated obs"}
    @invalid_attrs %{adoption_date: nil, age: nil, breed: nil, city: nil, name: nil, obs: nil}

    def animal_fixture(attrs \\ %{}) do
      {:ok, animal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Donation.create_animal()

      animal
    end

    test "list_animals/0 returns all animals" do
      animal = animal_fixture()
      assert Donation.list_animals() == [animal]
    end

    test "get_animal!/1 returns the animal with given id" do
      animal = animal_fixture()
      assert Donation.get_animal!(animal.id) == animal
    end

    test "create_animal/1 with valid data creates a animal" do
      assert {:ok, %Animal{} = animal} = Donation.create_animal(@valid_attrs)
      assert animal.adoption_date == ~D[2010-04-17]
      assert animal.age == 42
      assert animal.breed == "some breed"
      assert animal.city == "some city"
      assert animal.name == "some name"
      assert animal.obs == "some obs"
    end

    test "create_animal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Donation.create_animal(@invalid_attrs)
    end

    test "update_animal/2 with valid data updates the animal" do
      animal = animal_fixture()
      assert {:ok, animal} = Donation.update_animal(animal, @update_attrs)
      assert %Animal{} = animal
      assert animal.adoption_date == ~D[2011-05-18]
      assert animal.age == 43
      assert animal.breed == "some updated breed"
      assert animal.city == "some updated city"
      assert animal.name == "some updated name"
      assert animal.obs == "some updated obs"
    end

    test "update_animal/2 with invalid data returns error changeset" do
      animal = animal_fixture()
      assert {:error, %Ecto.Changeset{}} = Donation.update_animal(animal, @invalid_attrs)
      assert animal == Donation.get_animal!(animal.id)
    end

    test "delete_animal/1 deletes the animal" do
      animal = animal_fixture()
      assert {:ok, %Animal{}} = Donation.delete_animal(animal)
      assert_raise Ecto.NoResultsError, fn -> Donation.get_animal!(animal.id) end
    end

    test "change_animal/1 returns a animal changeset" do
      animal = animal_fixture()
      assert %Ecto.Changeset{} = Donation.change_animal(animal)
    end
  end

  describe "donators" do
    alias Amparo.Donation.Donator

    @valid_attrs %{address: "some address", birthday: ~D[2010-04-17], city: "some city", name: "some name", obs: "some obs", phone: "some phone", state: "some state"}
    @update_attrs %{address: "some updated address", birthday: ~D[2011-05-18], city: "some updated city", name: "some updated name", obs: "some updated obs", phone: "some updated phone", state: "some updated state"}
    @invalid_attrs %{address: nil, birthday: nil, city: nil, name: nil, obs: nil, phone: nil, state: nil}

    def donator_fixture(attrs \\ %{}) do
      {:ok, donator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Donation.create_donator()

      donator
    end

    test "list_donators/0 returns all donators" do
      donator = donator_fixture()
      assert Donation.list_donators() == [donator]
    end

    test "get_donator!/1 returns the donator with given id" do
      donator = donator_fixture()
      assert Donation.get_donator!(donator.id) == donator
    end

    test "create_donator/1 with valid data creates a donator" do
      assert {:ok, %Donator{} = donator} = Donation.create_donator(@valid_attrs)
      assert donator.address == "some address"
      assert donator.birthday == ~D[2010-04-17]
      assert donator.city == "some city"
      assert donator.name == "some name"
      assert donator.obs == "some obs"
      assert donator.phone == "some phone"
      assert donator.state == "some state"
    end

    test "create_donator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Donation.create_donator(@invalid_attrs)
    end

    test "update_donator/2 with valid data updates the donator" do
      donator = donator_fixture()
      assert {:ok, donator} = Donation.update_donator(donator, @update_attrs)
      assert %Donator{} = donator
      assert donator.address == "some updated address"
      assert donator.birthday == ~D[2011-05-18]
      assert donator.city == "some updated city"
      assert donator.name == "some updated name"
      assert donator.obs == "some updated obs"
      assert donator.phone == "some updated phone"
      assert donator.state == "some updated state"
    end

    test "update_donator/2 with invalid data returns error changeset" do
      donator = donator_fixture()
      assert {:error, %Ecto.Changeset{}} = Donation.update_donator(donator, @invalid_attrs)
      assert donator == Donation.get_donator!(donator.id)
    end

    test "delete_donator/1 deletes the donator" do
      donator = donator_fixture()
      assert {:ok, %Donator{}} = Donation.delete_donator(donator)
      assert_raise Ecto.NoResultsError, fn -> Donation.get_donator!(donator.id) end
    end

    test "change_donator/1 returns a donator changeset" do
      donator = donator_fixture()
      assert %Ecto.Changeset{} = Donation.change_donator(donator)
    end
  end
end
