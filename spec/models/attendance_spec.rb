require 'rails_helper'

RSpec.describe Attendance, type: :model do
	it "shouls persist a post" do
		Attendance.create(stripe_customer_id: "d54ffsddfsdf12s15fds4f")
		expect(Attendance.count).to eq(1)
	end
end