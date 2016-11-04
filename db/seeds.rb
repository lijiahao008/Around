# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.where(name: "News").first_or_create(name: "News")
Category.where(name: "Sports").first_or_create(name: "Sports")
Category.where(name: "Arts").first_or_create(name: "Arts")
Category.where(name: "Social").first_or_create(name: "Social")
Category.where(name: "Entertainment").first_or_create(name: "Entertainment")
Category.where(name: "Technology").first_or_create(name: "Technology")
Category.where(name: "Movements").first_or_create(name: "Movements")
Category.where(name: "Career & Business").first_or_create(name: "Career & Business")
Category.where(name: "Food & Drink").first_or_create(name: "Food & Drink")
Category.where(name: "Fashion & Beauty").first_or_create(name: "Fashion & Beauty")
Category.where(name: "Health & Wellness").first_or_create(name: "Health & Wellness")