FactoryGirl.define do
  factory :user do
    name 'bhavya'
    age 21
    email 'bhavya@gmail.com'
    password 'bhavyajani'
    factory_id 1
    type 'User::Buyer::Customer'
  end
end
