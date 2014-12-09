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

  factory :tool do
    name "Shovel"
    image_url "http://www.tool.com/tool.jpg"

    factory :borrowed_tool do
      user_id 123
    end
  end

  factory :post do
    title "Compost Bonanza"
    content "blah blah blah blah blah"
    user_id 123
    # admin - creates an assocation with the admin
  end
end
