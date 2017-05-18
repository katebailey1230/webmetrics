require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  user = User.all

end

users = User.all

10.times do
  RegisteredApplication.create!(
    name: Faker::Company.name,
    url: Faker::Internet.url,
    user: users.sample
  )
end

registered_application = RegisteredApplication.all

20.times do
  Event.create!(
    name: Faker::Lorem.word,
    registered_application: registered_application.sample
  )
end

events = Event.all

puts "Seed Data Created"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
