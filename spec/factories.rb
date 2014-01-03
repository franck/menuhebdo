#encoding: utf-8
FactoryGirl.define do
  factory :subscriber do
    email { Faker::Internet.safe_email }
  end
  factory :admin do
    email { Faker::Internet.safe_email }
    password "mypassword"
  end
  factory :menu_template do
    title { Faker::Lorem.words(3).join(' ') }
  end
  factory :day do
  end
  factory :meal do
  end
end
