defmodule InmanaWeb.RestaurantViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Siri cascudo", email: "hello@siricascudo.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "hello@siricascudo.com",
                 id: _id,
                 name: "Siri cascudo"
               }
             } = response
    end
  end
end
