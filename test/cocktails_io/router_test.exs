defmodule CocktailsIo.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "/api is forwarded to ApiRouter" do
    conn = conn(:get, "/api") |> put_req_header("accept", "application/json")
    response = CocktailsIo.Router.call(conn, CocktailsIo.Router.init([]))
    body = Poison.decode!(response.resp_body, keys: :atoms!)
    assert %{ok: true} = body
  end
end
