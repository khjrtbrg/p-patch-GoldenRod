FactoryGirl.define do
  factory :user do
    user_name "kristen"
    email "k@m.com"
    password "hello"
    password_confirmation "hello"
    admin false
  end

  factory :admin, class: User do
    user_name "kristina"
    email "k@h.com"
    password "hello"
    password_confirmation "hello"
    admin true
  end
end