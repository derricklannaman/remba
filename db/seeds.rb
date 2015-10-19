# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.destroy_all
User.destroy_all

s1 = User.create(email: "stylist100@gmail.com", type: 'Stylist')
s2 = User.create(email: "stylist200@gmail.com", type: 'Stylist')
s3 = User.create(email: "stylist300@gmail.com", type: 'Stylist')

m1 = User.create(email: "member100@gmail.com", type: 'Member')
m2 = User.create(email: "member200@gmail.com", type: 'Member')
m3 = User.create(email: "member300@gmail.com", type: 'Member')

Item.create(member_id: m1.id, title: "Dress 0", message: "This is a dress image")
Item.create(member_id: m2.id, title: "Dress 1", message: "This is a dress image 1")
Item.create(member_id: m3.id, title: "Dress 2", message: "This is a dress image 2")
Item.create(member_id: m3.id, title: "Dress 3", message: "This is a dress image 3")

puts "seeded..."
