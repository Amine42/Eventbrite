require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do
  user = User.create!(email: Faker::Internet.email,first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, encrypted_password: Faker::Internet.password)
end

10.times do
  event = Event.create!(title: Faker::Book.title, description: Faker::Lorem.paragraph, price: Faker::Number.number(1..1000), location: Faker::Address.city, duration: Faker::Number.number(1..150), start_date: Faker::Date.forward(200))
end

10.times do
  attendance = Attendance.create!(user_id: User.all.ids.sample, event_id: User.all.ids.sample, stripe_customer_id: "1")
end