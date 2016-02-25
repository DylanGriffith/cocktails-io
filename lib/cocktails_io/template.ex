defmodule CocktailsIo.Template do
  use Calliope.Engine, layout: "application", path: "./lib/cocktails_io/"

  @index_file "./lib/cocktails_io/templates/index.html.haml"

  def index do
    content_with_layout(:index, [title: Calliope])
  end
end
