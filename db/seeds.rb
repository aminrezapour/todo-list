3.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "helloworld",
    date_of_birth: Faker::Time.between(70.years.ago, 10.years.ago)
  )
end

users = User.all

12.times do
  item = Item.create!(
    name: Faker::Hipster.sentence,
    user: users.sample
  )
end

puts "#{User.count} user created"
puts "#{Item.count} items created"
