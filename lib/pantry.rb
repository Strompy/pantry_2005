class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def ingredient_in_pantry?(recipe)
    @stock.keys.all? do |ingredient|
      require "pry"; binding.pry
      recipe.ingredient_names.include? (ingredient.name)
    end
  end

  def enough_ingredient?(recipe)
    pry
  end

  def enough_ingredients_for?(recipe)
    ingredient_in_pantry?(recipe) && enough_ingredient?(recipe)
  end
end
