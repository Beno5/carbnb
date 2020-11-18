# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'clearing db...'
User.destroy_all
Car.destroy_all
puts "adding cars..."
me = User.create!(email: "haha@heh.com", password: "123456")
# bmw = Car.create!(model: "BMW", price: 50, fuel_type: "benzin", consumption: 9.75, category: "sport car", seat_number: 5, transmission: "automatik", user: me)
# audi = Car.create!(model: "Audi", price: 50, fuel_type: "disel", consumption: 9.75, category: "sport car", seat_number: 5, transmission: "automatik", user: me)
# mercedes = Car.create!(model: "Mercedes", price: 50, fuel_type: "benzin", consumption: 9.75, category: "sport car", seat_number: 5, transmission: "automatik", user: me)
puts "done"