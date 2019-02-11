require 'rails_helper'

RSpec.describe Event, type: :model do
	it "shouls persist a post" do
		Event.create(title: "Conference")
		expect(Event.count).to eq(1)
	end
end