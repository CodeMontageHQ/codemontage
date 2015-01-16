FactoryGirl.define do
  factory :service do
    association :user, factory: :user_with_github
    provider :github
    uid "2766324"
  end
end
