defmodule CocktailsIo.Router do
  use Plug.Router
  plug Plug.Static, at: "/assets", from: :cocktails_io

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, [], [port: 8765]
  end

  get "/" do
    send_resp(conn, 200, CocktailsIo.Template.index)
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
