class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    names = []
    @recipes.each do |recipe|
      names << recipe.ingredient_names
      names.flatten!
    end
    names.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
