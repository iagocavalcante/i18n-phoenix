defmodule PhoenixI18nWeb.ErrorJSONTest do
  use PhoenixI18nWeb.ConnCase, async: true

  test "renders 404" do
    assert PhoenixI18nWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PhoenixI18nWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
