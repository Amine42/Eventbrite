require 'rails_helper'

RSpec.describe User, type: :model do
	it "shouls persist a post" do
		User.create(email: "blablabla@gmail.com")
		expect(User.count).to eq(1)
	end
end