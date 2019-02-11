require 'rails_helper'

RSpec.describe Event, type: :model do
	it "should create a Event and be equal to 1" do
		Event.create(title: "Conference")
		expect(Event.count).to eq(1)
	end

	it "should create a event related to the attendance" do 
		event = Event.new(title: "Evenement")
		event.attendances << Attendance.new(event_id: "1")
		event.save
		expect(Attendance.count).to eq(1)
	end
end