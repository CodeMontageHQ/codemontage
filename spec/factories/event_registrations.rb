FactoryGirl.define do
  factory :event_registration do
    association :user
    association :event
  end

  factory :er_for_october, class: EventRegistration do
    association :event, factory: :october
    association :user, factory: :user_with_github
  end
end
