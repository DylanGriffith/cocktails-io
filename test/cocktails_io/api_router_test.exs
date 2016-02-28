defmodule CocktailsIo.ApiRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "GET /" do
    # Returns Content Type
    conn = conn(:get, "/") |> put_req_header("accept", "application/json")
    response = CocktailsIo.ApiRouter.call(conn, CocktailsIo.ApiRouter.init([]))
    assert {"content-type", "application/json; charset=utf-8"} in response.resp_headers
  end

  test "GET /cocktails" do
    # Returns all the cocktails
    json = json("/cocktails")

    assert %{data: cocktails} = json
    assert Enum.count(cocktails) > 5

    dylans_hurricane = cocktails |> Enum.find(fn(c) -> c[:id] == "dylans-hurricane" end)
    assert dylans_hurricane[:title] == "Dylan's Hurricane"
  end

  def json(path) do
    conn = conn(:get, path) |> put_req_header("accept", "application/json")
    response = CocktailsIo.ApiRouter.call(conn, CocktailsIo.ApiRouter.init([]))
    assert response.status == 200
    Poison.decode!(response.resp_body, keys: :atoms)
  end
end
