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

  def convert_units(recipe)
    recipe_pantry_hash = Hash.new
    recipe.ingredients.each_value do |ingredient|
      if ingredient < 1
        binding.pry
        Hash.new(:quantity => ingredient * 1000,
        :units => "Milli-Units")
      elsif ingredient > 100
        ingredient[:quantity] = ingredient / 100
        ingredient[:units] = "Centi-Units"
      else
        ingredient[:quantity] = ingredient
        ingredient[:units] = "Universal-Units"
      end
    end
  end

end
