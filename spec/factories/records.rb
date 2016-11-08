FactoryGirl.define do
  factory :record do
    association :user
    date "2016-11-08"
    association :project
  end
end
