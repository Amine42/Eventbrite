FactoryBot.define do
    factory :attendance do
      stripe_customer_id { "azazaz5a5z44d4d" }
      event { FactoryBot.create(:event) }
      user { FactoryBot.create(:user) }
    end
  end