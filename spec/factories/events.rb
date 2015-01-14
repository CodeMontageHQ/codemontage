FactoryGirl.define do
  factory :event do
    short_code "CodeCarnival2015x1"
    name "Code Carnival"
    start_date { Time.now + 1.day }
    end_date { Time.now + 1.day + 6.hours }

    factory :october do
      start_date { Time.new(2014,10,01) }
      end_date { Time.new(2014,10,31) }
    end
  end
end
