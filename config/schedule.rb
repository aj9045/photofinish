set :environment, "production"

every :sunday, :at => '11:59pm' do
  runner "Photo.find_and_create_upload_week"
  runner "Photo.update_datetime"
end
