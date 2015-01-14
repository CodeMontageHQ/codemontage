FactoryGirl.define do
  factory :user do
    email "user@codemontage.com"
    password "password"
    password_confirmation "password"
  end

  factory :user_with_github, class: User do
    email "user_with_github@codemontage.com"
    password "password"
    password_confirmation "password"

    after(:create) do |user|
      create_list(:service, 1, user: user)
    end
  end
end
