# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "destroying ingredients hehe"
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

puts "creating ingredients"

arrIngredients = ingredient["drinks"].each do |ingredient|
  ingredient["name"] = ingredient["strIngredient1"]
  puts "sorting ingredients"
ingredient.sort_by{ |thing, name| name.to_s }


  ingredient.delete("strIngredient1")


end

Ingredient.create!(arrIngredients)
puts "done!"
