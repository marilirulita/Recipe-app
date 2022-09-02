# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user_one=User.create(name: 'Tadesse Alemayehu',email: "tadesse@gmail.com", password: '123456')
@user_two=User.create(name: 'mar y sol Bautista',email: "mar@gmail.com", password: '123456')

#once user are created
@user_one=User.first
@user_two=User.last

(1..5).each do |i|
  Food.create(user: @user_one,name: "tibs#{i}",price: 120+i, quantity: i)
end
(1..5).each do |i|
  Food.create(user: @user_two,name: "kekel#{i}",price: 120+i, quantity: i)
end
(1..5).each do |i|
  Recipe.create(user: @user_one,
    name: "recipe#{i}",description: "description text" ,
    preparation_time: "#{10+i}",
    cooking_time: "#{12+i}", public: true)
end

(1..5).each do |i|
  Recipe.create(user: @user_two,
    name: "recipe#{i}",description: "description text" ,
    preparation_time: "#{10+i}",
    cooking_time: "#{12+i}", public: true)
end

#foods_recipes

@recipes=Recipe.all
Food.all.each do |food|
  RecipeFood.create!(food: food, recipe: @recipes[rand 0..@recipes.length-1], quantity: 2)
  RecipeFood.create!(food: food, recipe: @recipes[rand 0..@recipes.length-1], quantity: 2)
  RecipeFood.create!(food: food, recipe: @recipes[rand 0..@recipes.length-1], quantity: 2)
end
