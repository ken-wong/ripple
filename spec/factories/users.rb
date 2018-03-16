FactoryBot.define do
  factory :user do
    name "foo"
    sequence(:nickname) { |n| "nickname#{n}" }
    password "111111"
  end
end