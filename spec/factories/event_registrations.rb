FactoryGirl.define do
  factory :event_registration do
    association :user
    association :event
  end

  factory :er_for_october, class: EventRegistration do
    association :event, factory: :october
    association :user, factory: :user_with_github
  end

  factory :er_for_jan_wk1, class: EventRegistration do
    association :event, factory: :jan_wk1
    association :event, factory: :user_with_github
  end
end
