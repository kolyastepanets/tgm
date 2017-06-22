FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'Testing1'
    name { Faker::Name.first_name }
    surname { Faker::Name.last_name }
  end
end
