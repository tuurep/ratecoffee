# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Roastery.create name:"Stadin Paahtimo", year:1997
r2 = Roastery.create name:"Coffee Garage", year:1986
r3 = Roastery.create name:"Oldschool Roastery", year:1993

r1.coffees.create name:"Sumppi", style:"Americano"
r1.coffees.create name:"Kahvi", style:"Americano"
r1.coffees.create name:"Stadin Paahto", style:"Americano"
r2.coffees.create name:"Musta litku", style:"Americano"
r2.coffees.create name:"Pärinä", style:"Americano"
r3.coffees.create name:"Maitokahvi", style:"Latte"
r3.coffees.create name:"Pähkinäpaahto", style:"Espresso"
