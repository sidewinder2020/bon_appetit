require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

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

end
