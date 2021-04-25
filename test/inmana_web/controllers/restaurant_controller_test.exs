defmodule InmanaWeb.RestaurantControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the restaurant", %{conn: conn} do
      params = %{name: "Siri cascudo", email: "hello@siricascudo.com"}

      response =
        conn
        |> post(Routes.restaurant_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "hello@siricascudo.com",
                 "id" => _id,
                 "name" => "Siri cascudo"
               }
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "hello@siricascudo.com"}
      expected_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurant_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end
end
