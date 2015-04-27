FactoryGirl.define do
  factory :upload_tracker do
    upload_week "February 29, 2014"

    factory :invalid_upload_tracker do
      upload_week nil
    end
  end
end