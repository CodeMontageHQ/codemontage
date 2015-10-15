FactoryGirl.define do
  factory :project do
    association :organization
    name "CodeMontage"
    github_repo "codemontage"
    submitted_github_url "https://github.com/CodeMontageHQ/codemontage"
  end
end
