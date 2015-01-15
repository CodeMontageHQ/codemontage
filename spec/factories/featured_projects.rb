FactoryGirl.define do
  factory :featured_project do
    association :event
    association :project
  end

  factory :oct_featured_project, class: FeaturedProject do
    association :event, factory: :october
    association :project, factory: :fake_empirical_project
  end
end
