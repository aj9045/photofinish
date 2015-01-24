FactoryGirl.define do
  factory :user do
    username "test_username"
    sequence(:email) { |n| "test#{n}@dbc.com"}
    about "about me"
    password "test"
    password_confirmation "test"

    factory :invalid_user do
      email nil
    end
  end
end