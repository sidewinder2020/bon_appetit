class Pantry
attr_reader :pantry_stock,
            :cookbook

  def initialize
    @pantry_stock = {}
    @cookbook = []
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
        recipe_pantry_hash[food] = Hash.new.merge({:quantity => ingredient * 1000,
        :units => "Milli-Units"})
      elsif ingredient > 100
        recipe_pantry_hash[food] = Hash.new.merge({:quantity => ingredient / 100, :units => "Centi-Units"})
      else
        recipe_pantry_hash[food] = Hash.new.merge({:quantity => ingredient, :units => "Universal-Units"})
      end
    end
    recipe_pantry_hash
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  def what_can_i_make
    recipes_possible = []
    @cookbook.each do |recipe|
      binding.pry
        if pair_present?(@pantry_stock, recipe.ingredients.keys.join(""), recipe.ingredients.valuesjoin("").to_i)
          recipes_possible << recipe.name
          #recipes.ingredients.keys/values returns an array...need it to be a string and integer
          #compare the key and value of each in the pantry stock hash to the recipe.ingredients hashes - see if the values are equal to or greater than
          #@pantry_stock.keys.include?(recipe.ingredients.keys)
        end
      end
    recipes_possible
  end

  # def ingredients_included_in_recipes
  #   @pantry_stock.each do |key, value|
  #     recipe.ingredients[key] == value
  #     #thinking of adding another method to iterate through the      recipe and ingredients separately
  # end

  # What can i make?
    #pantry.what_can_i_make # => ["Brine Shot", "Peanuts"]
  # How many can i make?
    #pantry.how_many_can_i_make # => {"Brine Shot" => 4, "Peanuts" => 2}

end
