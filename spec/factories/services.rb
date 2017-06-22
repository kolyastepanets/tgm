FactoryGirl.define do
  factory :service do
    name { Faker::Job.title }
    classification { Service::TYPES.sample }
  end
end
