defmodule CocktailsIo.Cocktail.Ingredient do
  defstruct [:name, :amount]
end

defmodule CocktailsIo.Cocktail.Image do
  defstruct [:uri]
end

defmodule CocktailsIo.Cocktail do
  defstruct [:id, :title, :image, :description, :ingredients, :method, :notes]
end
