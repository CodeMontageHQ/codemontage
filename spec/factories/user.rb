FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@codemontage.com" }
    password "password"
    password_confirmation "password"

    factory :user_with_github, class: User do
      after(:create) do |user|
        create_list(:service, 1, user: user)
      end
    end
  end
end
