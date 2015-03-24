class CreateUploadTrackers < ActiveRecord::Migration
  def change
    create_table :upload_trackers do |t|
      t.string :upload_week, null: false

      t.timestamps
    end
  end
end
