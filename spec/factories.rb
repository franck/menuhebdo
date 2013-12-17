#encoding: utf-8
FactoryGirl.define do
  factory :subscriber do
    email { Faker::Internet.safe_email }
  end
end
