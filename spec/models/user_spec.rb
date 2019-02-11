require 'rails_helper'

RSpec.describe User, type: :model do
	it "should create a User and be equal to 1" do
		User.create(email: "blablabla@gmail.com")
		expect(User.count).to eq(1)
	end

	it "should create a user related to the attendance" do 
		user = User.new(email: "blablabla@gmail.com")
		user.attendances << Attendance.new(user_id: "1")
		user.save
		expect(Attendance.count).to eq(1)
	end
end