FactoryGirl.define do
  factory :task do
    title { Faker::Lorem.word }
    association :user
    association :service
  end
end
