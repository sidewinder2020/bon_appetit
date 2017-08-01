require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_you_can_check_stock
    assert_equal 0, @pantry.stock_check("Cheese")
  end

  def test_you_can_add_stock_then_return_stock_check
    @pantry.restock("Cheese", 10)

    assert_equal 10, @pantry.stock_check("Cheese")
  end

  def test_you_can_add_amount_to_already_established_food
    @pantry.restock("Cheese", 10)
    @pantry.restock("Cheese", 20)

    assert_equal 30, @pantry.stock_check("Cheese")
  end

  def test_you_can_create_new_recipe
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)

    assert_instance_of Recipe, r
  end

  def test_you_can_convert_units_from_recipe
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)

    assert_instance_of Hash, @pantry.convert_units(r)
  end

  def test_you_can_add_recipes_to_cookbook
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Brine Shot")
    r2.add_ingredient("Brine", 10)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    @pantry.add_to_cookbook(r1)
    @pantry.add_to_cookbook(r2)
    @pantry.add_to_cookbook(r3)

    assert_equal 3, @pantry.cookbook.length
  end

  def test_what_can_I_make
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Brine Shot")
    r2.add_ingredient("Brine", 10)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    @pantry.add_to_cookbook(r2)
    @pantry.add_to_cookbook(r1)
    @pantry.add_to_cookbook(r3)

    @pantry.restock("Cheese", 10)
    @pantry.restock("Flour", 20)
    @pantry.restock("Brine", 40)
    @pantry.restock("Raw nuts", 20)
    @pantry.restock("Salt", 20)

    assert_equal ["Brine Shot", "Peanuts"], @pantry.what_can_i_make
  end

end
