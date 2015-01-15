FactoryGirl.define do
  factory :project do
    association :organization
    name "CodeMontage"
    github_repo "codemontage"
  end

  factory :fake_empirical_project, class: Project do
    association :organization, factory: :fake_empirical_org
    sequence(:name) { |n| "Fake Empirical Project ##{n}" }
    github_repo "empirical-core"
  end
end
