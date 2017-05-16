require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  user = User.all

end

users = User.all

30.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: users.sample
  )
end

registered_apps = RegisteredApplication.all

100.times do
  Event.create!(
    name: Faker::Hacker.verb,
    registered_application: registered_apps.sample,
  )
end

puts "Seed Data Created"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
