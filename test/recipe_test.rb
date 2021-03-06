require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
  end
  def test_it_exists
    assert_instance_of Recipe, @recipe1
  end

  def test_it_has_attributes
    recipe1 = Recipe.new("Mac and Cheese")
    expected = {}
    assert_equal "Mac and Cheese", recipe1.name
    assert_equal expected, recipe1.ingredients_required
  end

  def test_it_can_add_ingredients
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expected = {
      ingredient1 => 6,
      ingredient2 => 8
    }
    assert_equal expected, recipe1.ingredients_required
  end

  def test_it_can_list_ingredients
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    expected = [@ingredient1, @ingredient2]
    assert_equal expected, @recipe1.ingredients
  end

  def test_it_can_calculate_total_calories
    assert_equal 440, @recipe1.total_calories
    assert_equal 675, @recipe2.total_calories
  end

  def test_it_can_list_ingredients_names
    expected = ["Cheese", "Macaroni"]
    assert_equal expected, @recipe1.ingredient_names
  end
end
