require_relative 'cookbook'


mex_cuisine = Cookbook.new("Mexican Cooking")
burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans",
    "place beans in tortilla", "sprinkle cheese on top", "roll up"])

# puts mex_cuisine.title
# puts burrito.title
# p burrito.ingredients
# p burrito.steps
#
# mex_cuisine.title = "Mexican Recipes"
# puts mex_cuisine.title
#
# burrito.title = "Veggie Burrito"
# burrito.ingredients = ["tortilla", "tomatoes"]
# burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]
#
# p burrito.title
# p burrito.ingredients
#
# mex_cuisine.recipes
# mex_cuisine.add_recipe(burrito)
# p mex_cuisine.recipes

puts mex_cuisine.recipe_titles
puts mex_cuisine.recipe_ingredients
