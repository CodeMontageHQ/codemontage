FactoryGirl.define do
  factory :project do
    association :organization
    name "CodeMontage"
    github_repo "codemontage"
  end

  factory :cm_project, class: Project do
    name { Faker::Lorem.word }
    github_repo { Faker::Lorem.word }

    trait :inactive do
      is_active false
    end

    trait :approved do
      is_approved true
    end
  end
end
