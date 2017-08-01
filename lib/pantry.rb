class Pantry

  def initialize
    @pantry_stock = {}
  end

  def stock_check(food_name)
    if @pantry_stock[food_name] != nil
      @pantry_stock[food_name]
    else
      return 0
    end
  end

  def restock(food_name, amount)
    @pantry_stock[food_name] = amount
  end

end



# pantry.stock_check("Cheese")
# # => 0
# pantry.restock("Cheese", 10)
# pantry.stock_check("Cheese")
# # => 10
# pantry.restock("Cheese", 20)
# pantry.stock_check("Cheese")
# # => 30
