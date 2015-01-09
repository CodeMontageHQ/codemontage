FactoryGirl.define do
  factory :event do
    short_code "CodeCarnival2015x1"
    name "Code Carnival"
    start_date { Time.now + 1.day }
    end_date { Time.now + 1.day + 6.hours }
  end
end
