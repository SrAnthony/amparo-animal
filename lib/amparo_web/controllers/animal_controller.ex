defmodule AmparoWeb.AnimalController do
  use AmparoWeb, :controller
  use HTTPoison.Base

  alias Amparo.Donation
  alias Amparo.Donation.Animal

  def index(conn, _params) do
    animals = Donation.list_animals()
    changeset = Donation.change_animal(%Animal{})
    render(conn, "index.html", animals: animals, changeset: changeset)
  end

  def new(conn, _params) do
    animals = Donation.list_animals()
    changeset = Donation.change_animal(%Animal{})
    image = get_dog_body() |> get_dog_image()
    render(conn, "new.html", changeset: changeset, animals: animals, image: image)
  end

  def get_dog_body do
    %HTTPoison.Response{ body: body } = HTTPoison.get! "https://api.thedogapi.com/v1/images/search?"
    body |> Poison.decode!
  end

  def get_dog_image([%{"url" => url}]) do
    url
  end

  def auto_create(conn, _params) do
    [ %{"breeds" => breeds, "url" => url} ] = get_dog_body()
    if(List.first(breeds) == nil) do
      auto_create(conn, {})
    else
      %{"name" => name, "bred_for" => bred_for} = List.first(breeds)
      animal = %{"name" => name, "image" => url, "breed" => bred_for}
      create(conn, %{"animal" => animal})
    end
  end

  def create(conn, %{"animal" => animal_params}) do
    case Donation.create_animal(animal_params) do
      {:ok, animal} ->
        conn
        |> put_flash(:info, "Animal created successfully.")
        |> redirect(to: animal_path(conn, :show, animal))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    animals = Donation.list_animals()
    animal = Donation.get_animal!(id)
    render(conn, "show.html", animal: animal, animals: animals)
  end

  def edit(conn, %{"id" => id}) do
    image = get_dog_body() |> get_dog_image()
    animals = Donation.list_animals()
    animal = Donation.get_animal!(id)
    changeset = Donation.change_animal(animal)
    render(conn, "edit.html", animal: animal, animals: animals, changeset: changeset, image: image)
  end

  def update(conn, %{"id" => id, "animal" => animal_params}) do
    animal = Donation.get_animal!(id)

    case Donation.update_animal(animal, animal_params) do
      {:ok, animal} ->
        conn
        |> put_flash(:info, "Animal updated successfully.")
        |> redirect(to: animal_path(conn, :show, animal))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", animal: animal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    animal = Donation.get_animal!(id)
    {:ok, _animal} = Donation.delete_animal(animal)

    conn
    |> put_flash(:info, "Animal deleted successfully.")
    |> redirect(to: animal_path(conn, :index))
  end
end
