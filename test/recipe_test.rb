require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
  end
  def test_it_exists
    assert_instance_of Recipe, @recipe1
  end

  def test_it_has_attributes
    expected = {}
    assert_equal "Mac and Cheese", @recipe.name
    assert_equal expected, @recipe1.ingredients_required
  end
end
