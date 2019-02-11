require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(email: "blablabla@hotmail.com",description: "Blablabla",first_name: "John", last_name: "Doe")
	end
	
	it "is valid with valid attributes" do
		expect(@user).to be_a(User)
		expect(@user).to be_valid
	end

	it "should create a User and be equal to 1" do
		User.create(email: "blablabla@gmail.com")
		expect(User.count).to eq(2)
	end

	it "should create a user related to the attendance" do 
		user = User.new(email: "blablabla@gmail.com")
		user.attendances << Attendance.new(user_id: "1")
		user.save
		expect(Attendance.count).to eq(1)
	end

	it "should return a string" do
		expect(@user.email).to be_a(String)
	end

	it "should return a string" do
		expect(@user.last_name).to be_a(String)
	end
end