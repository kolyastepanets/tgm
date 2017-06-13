FactoryGirl.define do
  factory :task do
    title { Faker::Lorem.word }
    description { Faker::ChuckNorris.fact }
    address { Faker::Address.street_address }
    held_at { Faker::Time.between(DateTime.now, DateTime.now + 5) }
    association :user
    association :service
  end
end
