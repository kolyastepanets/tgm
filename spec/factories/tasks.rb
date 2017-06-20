FactoryGirl.define do
  factory :task do
    title { Faker::Lorem.word }
    address { Faker::Address.street_address }
    association :user
    association :service
  end
end
