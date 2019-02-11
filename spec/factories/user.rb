FactoryBot.define do
    factory :user do
      email { "blabla@gmail.com" }
      encrypted_password { "bonjour" }
      description { "J'aime les test" }
      first_name { "Jean" }
      last_name { "Phil" }
    end
  end