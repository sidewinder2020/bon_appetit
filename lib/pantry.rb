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
    recipe.ingredients.each do |food, ingredient|
      if ingredient < 1
        recipe_pantry_hash[food] = Hash.new(:quantity => ingredient * 1000,
        :units => "Milli-Units")
        binding.pry
      elsif ingredient > 100
        recipe_pantry_hash[food] = Hash.new(:quantity => ingredient / 100, :units => "Centi-Units")
      else
        recipe_pantry_hash[food] = Hash.new(:quantity => ingredient, :units => "Universal-Units")
      end
    end
  end

end
