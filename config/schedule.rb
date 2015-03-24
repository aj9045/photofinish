set :environment, "development"

every :sunday, :at => '11:59pm' do
  runner "Photo.update_datetime"
end
