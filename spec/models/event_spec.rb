require 'rails_helper'

RSpec.describe Event, type: :model do

	before(:each) do
		@event = FactoryBot.create(:event)
	end

	it "is valid with valid attributes" do
    expect(@event).to be_a(Event)
    expect(@event).to be_valid 
	end
	
	describe "#start_date" do
		it "should be in the future " do
			expect(@event.start_date.to_date.future?).to eq(true)
		end
	end

	it "should return a integer" do
		expect(@event.price).to be_a(Integer)
	end
end