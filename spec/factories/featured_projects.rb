FactoryGirl.define do
  factory :featured_project do
    association :event
    association :project
  end
end
