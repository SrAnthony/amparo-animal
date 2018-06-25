defmodule AmparoWeb.DonatorController do
  use AmparoWeb, :controller

  alias Amparo.Donation
  alias Amparo.Donation.Donator

  def index(conn, _params) do
    donators = Donation.list_donators()
    render(conn, "index.html", donators: donators)
  end

  def new(conn, _params) do
    changeset = Donation.change_donator(%Donator{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"donator" => donator_params}) do
    case Donation.create_donator(donator_params) do
      {:ok, donator} ->
        conn
        |> put_flash(:info, "Donator created successfully.")
        |> redirect(to: donator_path(conn, :show, donator))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    donator = Donation.get_donator!(id)
    render(conn, "show.html", donator: donator)
  end

  def edit(conn, %{"id" => id}) do
    donator = Donation.get_donator!(id)
    changeset = Donation.change_donator(donator)
    render(conn, "edit.html", donator: donator, changeset: changeset)
  end

  def update(conn, %{"id" => id, "donator" => donator_params}) do
    donator = Donation.get_donator!(id)

    case Donation.update_donator(donator, donator_params) do
      {:ok, donator} ->
        conn
        |> put_flash(:info, "Donator updated successfully.")
        |> redirect(to: donator_path(conn, :show, donator))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", donator: donator, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    donator = Donation.get_donator!(id)
    {:ok, _donator} = Donation.delete_donator(donator)

    conn
    |> put_flash(:info, "Donator deleted successfully.")
    |> redirect(to: donator_path(conn, :index))
  end
end
