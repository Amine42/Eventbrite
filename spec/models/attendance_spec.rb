require 'rails_helper'

RSpec.describe Attendance, type: :model do
	it "should create a Attendance and be equal to 1" do
		Attendance.create(stripe_customer_id: "d54ffsddfsdf12s15fds4f")
		expect(Attendance.count).to eq(1)
	end
end