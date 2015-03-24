class AddUploadTrackerIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :upload_tracker_id, :integer, references: :upload_tracker
  end
end
