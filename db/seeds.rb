# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

userOne=User.create(name: 'Tadesse Alemayehu',email: "tadesse@gmail.com", password: '123456')
userTwo=User.create(name: 'mar y sol Bautista',email: "mar@gmail.com", password: '123456')

(1..5).each do |i|
  Food.create(user: userOne,name: "tibs#{i}",price: 120+i, quantity: i)
end
(1..5).each do |i|
  Recipe.create(user: userTwo,name: "tibs#{i}",preparation_time: "#{10+i}", cooking_time: "#{12+i}", public: true)
end
