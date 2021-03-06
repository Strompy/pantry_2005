class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
  end

  def ingredients
    @ingredients_required.keys
  end

  def ingredient_names
    ingredients.map do |ingredient|
      ingredient.name
    end
  end

  def total_calories
    calories = 0
    @ingredients_required.each do |ingredient, quantity|
      calories += (ingredient.calories * quantity)
    end
    calories
  end
end
