defmodule CocktailsIo.CocktailRepo do
  @files files = Path.wildcard("./recipes/*.yml") |> Enum.map(&Path.expand/1) |> Enum.map(fn(f) -> {f, elem(File.read(f), 1)} end)

  def load_all do
    @files |> Enum.map(fn({f, data}) ->
      {f, YamlElixir.read_from_string(data)}
    end) |> Enum.map(fn({f, c}) ->
      Map.put(c, :id, file_path_to_id(f))
    end)
  end

  def map_to_struct(map) do
    keys = Map.keys(%CocktailsIo.Cocktail{}) -- [:__struct__]

    if map["image"] do
      map = Map.put(map, "image", %CocktailsIo.Cocktail.Image{uri: map["image"]["uri"]})
    end

    if map["ingredients"] do
      ingredients = Enum.map(map["ingredients"], fn(i) ->
        %CocktailsIo.Cocktail.Ingredient{name: i["name"], amount: i["amount"]}
      end)
      map = Map.put(map, "ingredients", ingredients)
    end

    key_vals = Enum.map keys, fn(k) -> {k, map[Atom.to_string(k)]} end
    struct(%CocktailsIo.Cocktail{}, key_vals)
  end

  def file_path_to_id(path) do
    Path.basename(path, ".yml")
  end
end
