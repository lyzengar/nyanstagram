# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
User.destroy_all

user1 = User.create({
    name: "Andrew", 
    email: "email@email.org", 
    password: "123abc"
})

cat1 = Cat.new({ 
    name: "Boris", 
    caption: "Oh hai!",
    image: File.new("#{Rails.root}/db/seed_images/boris.jpg")
})

# image1 = Photo.new(image: File.new("#{Rails.root}/db/seed_images/cat2.jpg"))

User.first.cats << cat1
# User.first.cats.first.photos << image1

