require 'rails_helper'

RSpec.describe Event, type: :model do
	it "should create a Event and be equal to 1" do
		Event.create(title: "Conference")
		expect(Event.count).to eq(1)
	end
end