defmodule CocktailsIo.CocktailRepoTest do
  use ExUnit.Case
  alias CocktailsIo.CocktailRepo, as: R

  test "#file_path_to_id" do
    assert R.file_path_to_id("/path/to/mojito.yml") == "mojito"
  end

  test "#map_to_struct" do
    map = %{ "title" => "Mojito", "description" => "Yummy" }
    assert R.map_to_struct(map) == %CocktailsIo.Cocktail{title: "Mojito", description: "Yummy"}

    map = %{ "title" => "Mojito", "image" => %{ "uri" => "http://example.com/image.png" } }
    image = %CocktailsIo.Cocktail.Image{uri: "http://example.com/image.png"}
    assert R.map_to_struct(map) == %CocktailsIo.Cocktail{title: "Mojito", image: image}

    map = %{ "title" => "Mojito", "ingredients" => [%{"name" => "White Rum", "amount" => "60ml"}] }
    ingredients = [%CocktailsIo.Cocktail.Ingredient{name: "White Rum", amount: "60ml"}]
    assert R.map_to_struct(map) == %CocktailsIo.Cocktail{title: "Mojito", ingredients: ingredients}
  end
end
