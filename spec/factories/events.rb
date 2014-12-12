FactoryGirl.define do
  factory :event do
    title "Sunflower harvest"
    description "An amazing description"
    location "Community garden"
    date "2014-12-12"
    start_time "2014-12-12 10:08:39"
    end_time "2014-12-12 11:08:39"
    user_id 1
  end
end
