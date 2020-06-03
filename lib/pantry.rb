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
      recipe.ingredient_names.include? (ingredient.name)
    end
  end


  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, quantity|
      stock_check(ingredient) >= quantity
    end
  end
end
