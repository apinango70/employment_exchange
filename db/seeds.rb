# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts " Creating 10 samples user."

10.times do |n|
    name = Faker::Name.name
    email = Faker::Internet.email
    password = "123456"
    User.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
end
puts " Created 10 samples user."


puts "Creating 10 job records with Faker-generated data"
10.times do
  JobPosting.create(
    title: Faker::Job.title,
    department: Faker::Job.field,
    description: Faker::Lorem.paragraph,
    user_id: 1 # Set the user_id as needed
  )
end
puts "Created 10 job records with Faker-generated data"
