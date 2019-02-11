require 'rails_helper'

RSpec.describe User, type: :model do
	it "should create a User and be equal to 1" do
		User.create(email: "blablabla@gmail.com")
		expect(User.count).to eq(1)
	end
end