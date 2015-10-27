FactoryGirl.define do
  factory :cm_job, class: Job do
    title Faker::Lorem.sentence(1)

    trait :expire_tomorrow do
      expires_at DateTime.now + 1.day
    end

    trait :expired do
      expires_at DateTime.now - 1.day
    end
  end
end
