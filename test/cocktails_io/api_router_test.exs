defmodule CocktailsIo.ApiRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "GET /" do
    # Returns Content Type
    conn = conn(:get, "/") |> put_req_header("accept", "application/json")
    response = CocktailsIo.ApiRouter.call(conn, CocktailsIo.ApiRouter.init([]))
    assert {"content-type", "application/json; charset=utf-8"} in response.resp_headers
  end
end
