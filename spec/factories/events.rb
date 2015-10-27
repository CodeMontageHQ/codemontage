FactoryGirl.define do
  factory :event do
    short_code "CodeCarnival2015x1"
    name "Code Carnival"
    start_date { Time.now + 1.day }
    end_date { Time.now + 1.day + 6.hours }

    factory :october do
      start_date { Time.new(2014, 10, 01) }
      end_date { Time.new(2014, 10, 31) }
    end
  end

  factory :cm_event, class: Event do
    short_code { Faker::Lorem.word  }
    name Faker::Lorem.word

    trait :end_tomorrow do
      start_date Time.now
      end_date Time.now + 1.day
    end

    trait :future do
      start_date Time.now + 1.day
      end_date Time.now + 2.day
    end

    trait :end_today do
      start_date Time.now
      end_date Time.now
    end

    trait :public do
      is_public true
    end
  end
end
