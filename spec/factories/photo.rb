FactoryGirl.define do
  factory :photo do
    title "test_title"
    description "description"
    user

    factory :invalid_photo do
      title nil
    end
  end
end