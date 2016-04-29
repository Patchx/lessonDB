FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"
  end

  factory :admin, class: User do
    admin true
    name "Admin"
    email "robert.anderson.fl@gmail.com"
    password "please123"
  end
end
