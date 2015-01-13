FactoryGirl.define do
  factory :project do
    association :organization
    name "CodeMontage"
    github_repo "codemontage"
  end

  factory :fake_empirical_project do
    association :fake_empirical_org
    name "Fake Empirical Project"
    github_repo "empirical-core"
  end
end
