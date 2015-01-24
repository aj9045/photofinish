FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "test_name#{n}"}
    sequence(:email) { |n| "test#{n}@dbc.com"}
    about "about me"
    password "test"
    password_confirmation "test"

    factory :invalid_user do
      email nil
    end
  end
end