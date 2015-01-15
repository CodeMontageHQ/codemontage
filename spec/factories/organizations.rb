FactoryGirl.define do
  factory :organization do
    name "CodeMontage"
    github_org "CodeMontageHQ"
  end

  factory :fake_empirical_org, class: Organization do
    name "Fake Empirical Org"
    github_org "empirical-org"
  end
end
