FactoryGirl.define do
  factory :project do
    association :organization
    name "CodeMontage"
    github_repo "codemontage"
  end
end
