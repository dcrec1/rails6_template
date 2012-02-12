FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@email.com" }
    password "abc123"
  end
end
