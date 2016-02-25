defmodule CocktailsIo.ApiRouter do
  use Plug.Router

  plug :json_header_plug
  plug :match
  plug :dispatch

  get "/" do
    data = %{
      ok: true,
      timestamp: :erlang.system_time(:seconds)
    }
    send_resp(conn, 200, Poison.encode!(data))
  end

  match _ do
    send_resp(conn, 404, "{}")
  end

  def json_header_plug(conn, opts) do
    conn |> put_resp_content_type("application/json")
  end
end
