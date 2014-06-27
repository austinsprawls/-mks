class Cookbook
    def initialize(title)
        @title = title
        @recipes = []
    end

    def add_recipe(recipe)
        @recipes << recipe
        puts "Added a recipe to the collection: #{recipe.title}"
    end

    def recipe_titles
        @recipes.each {|recipe| puts recipe.title}
    end

    def recipe_ingredients
        @recipes.each {|recipe| puts "These are the ingredients for #{recipe.title}: #{recipe.ingredients}"}
    end

    attr_accessor :title
    attr_reader :recipes
end

class Recipe
    def initialize(title, ingredients, steps)
        @title = title
        @ingredients = ingredients
        @steps = steps
    end

    def print_recipe
        puts "Recipe name: #{@title}"
        puts "Ingredients: #{@ingredients.join(", ")}"
        puts "Steps: #{@steps.join(", ")}"
    end

    attr_accessor :title
    attr_accessor :ingredients
    attr_accessor :steps
end

mex_cuisine = Cookbook.new("Mexican Cooking")
burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans",
    "place beans in tortilla", "sprinkle cheese on top", "roll up"])
queso = Recipe.new("Queso", ["cheese", "peppers"], ["melt cheese", "add peppers"])

puts mex_cuisine.title
puts burrito.title
p burrito.ingredients
p burrito.steps

mex_cuisine.title = "Mexican Recipes"
puts mex_cuisine.title

burrito.title = "Veggie Burrito"
burrito.ingredients = ["tortilla", "tomatoes"]
burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

p burrito.title
p burrito.ingredients

mex_cuisine.recipes
mex_cuisine.add_recipe(burrito)
p mex_cuisine.recipes

puts mex_cuisine.recipe_titles
puts mex_cuisine.recipe_ingredients
