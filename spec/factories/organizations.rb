FactoryGirl.define do
  factory :organization do
    name "CodeMontage"
    github_org "CodeMontageHQ"
  end

  factory :cm_organization, class: Organization do
    name Faker::Company.name
  end
end
