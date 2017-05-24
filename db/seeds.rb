require 'faker'

user1 = User.create(email: "user1@test.com", password: "userpassword", confirmed_at: Time.now)
user2 = User.create(email: "user2@test.com", password: "userpassword", confirmed_at: Time.now)

10.times do
  RegisteredApplication.create!(
    name: Faker::Company.name,
    url: Faker::Internet.url,
    user: user1
  )
end

10.times do
  RegisteredApplication.create!(
    name: Faker::Company.name,
    url: Faker::Internet.url,
    user: user2
  )
end

registered_application = RegisteredApplication.all

20.times do
  Event.create!(
    name: Faker::Lorem.words,
    registered_application: registered_application.sample
  )
end



puts "Seed Data Created"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
