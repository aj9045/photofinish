FactoryGirl.define do
  factory :user do
    username "test_username"
    sequence(:email) { |n| "name#{n}@dbc.com" }
    about "about me"
    password "pswrd"
    password_confirmation "pswrd"

      factory :invalid_user do
        username nil
      end
  end
end