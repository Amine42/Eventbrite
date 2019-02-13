require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do
  user = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, password: "Password")
end

10.times do
  event = Event.create!(title: Faker::Book.title, description: Faker::Lorem.paragraph, price: rand(1..1000), location: Faker::Address.city, duration: rand(1..150) * 5, start_date: Faker::Date.forward(200), admin_id: rand((User.first.id)..(User.last.id)))
end

10.times do
  attendance = Attendance.create!(user_id: User.all.ids.sample, event_id: User.all.ids.sample, stripe_customer_id: '1')
end
