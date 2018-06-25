defmodule AmparoWeb.DonatorControllerTest do
  use AmparoWeb.ConnCase

  alias Amparo.Donation

  @create_attrs %{address: "some address", birthday: ~D[2010-04-17], city: "some city", name: "some name", obs: "some obs", phone: "some phone", state: "some state"}
  @update_attrs %{address: "some updated address", birthday: ~D[2011-05-18], city: "some updated city", name: "some updated name", obs: "some updated obs", phone: "some updated phone", state: "some updated state"}
  @invalid_attrs %{address: nil, birthday: nil, city: nil, name: nil, obs: nil, phone: nil, state: nil}

  def fixture(:donator) do
    {:ok, donator} = Donation.create_donator(@create_attrs)
    donator
  end

  describe "index" do
    test "lists all donators", %{conn: conn} do
      conn = get conn, donator_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Donators"
    end
  end

  describe "new donator" do
    test "renders form", %{conn: conn} do
      conn = get conn, donator_path(conn, :new)
      assert html_response(conn, 200) =~ "New Donator"
    end
  end

  describe "create donator" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, donator_path(conn, :create), donator: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == donator_path(conn, :show, id)

      conn = get conn, donator_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Donator"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, donator_path(conn, :create), donator: @invalid_attrs
      assert html_response(conn, 200) =~ "New Donator"
    end
  end

  describe "edit donator" do
    setup [:create_donator]

    test "renders form for editing chosen donator", %{conn: conn, donator: donator} do
      conn = get conn, donator_path(conn, :edit, donator)
      assert html_response(conn, 200) =~ "Edit Donator"
    end
  end

  describe "update donator" do
    setup [:create_donator]

    test "redirects when data is valid", %{conn: conn, donator: donator} do
      conn = put conn, donator_path(conn, :update, donator), donator: @update_attrs
      assert redirected_to(conn) == donator_path(conn, :show, donator)

      conn = get conn, donator_path(conn, :show, donator)
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, donator: donator} do
      conn = put conn, donator_path(conn, :update, donator), donator: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Donator"
    end
  end

  describe "delete donator" do
    setup [:create_donator]

    test "deletes chosen donator", %{conn: conn, donator: donator} do
      conn = delete conn, donator_path(conn, :delete, donator)
      assert redirected_to(conn) == donator_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, donator_path(conn, :show, donator)
      end
    end
  end

  defp create_donator(_) do
    donator = fixture(:donator)
    {:ok, donator: donator}
  end
end
