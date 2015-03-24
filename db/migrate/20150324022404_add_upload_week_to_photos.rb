class AddUploadWeekToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :upload_week, :string
  end
end
