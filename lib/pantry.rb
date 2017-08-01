class Pantry
attr_reader :pantry_stock

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
    if @pantry_stock[food_name] != nil
      @pantry_stock[food_name] = @pantry_stock[food_name] + amount
    else
      @pantry_stock[food_name] = amount
    end
  end

end
