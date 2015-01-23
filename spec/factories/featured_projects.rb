FactoryGirl.define do
  factory :featured_project do
    association :event
    association :project

    factory :fp_for_october do
      association :event, factory: :october
    end
  end
end
