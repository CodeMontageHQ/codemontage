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

  factory :cm_user, class: User do
    email { "#{Faker::Internet.user_name}@#{Faker::Internet.domain_name}" }
    password Faker::Internet.password
  end
end
