
FactoryBot.define do
	factory :event do
		start_date { Faker::Date.forward(400) }
		duration {5*rand(1..20)}
		title { Faker::Lorem.paragraph(3) }
		description { Faker::Lorem.paragraph(10) }
		price { rand(1..1000) }
		location { Faker::HarryPotter.location }
	end
end