require 'rails_helper'

RSpec.describe Event, type: :model do

	before(:each) do
		@event = FactoryBot.create(:event)
	end

	it "is valid with valid attributes" do
    expect(@event).to be_valid
	end
end