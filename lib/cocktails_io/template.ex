defmodule CocktailsIo.Template do
  require EEx
  EEx.function_from_file :def, :index, "./lib/cocktails_io/templates/index.html.eex", []
end
