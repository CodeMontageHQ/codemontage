FactoryGirl.define do
  factory :featured_project do
    association :event
    association :project
  end

  factory :fake_wcd_featured do
    association :fake_wcd_event
    association :fake_empirical_project
  end
end
