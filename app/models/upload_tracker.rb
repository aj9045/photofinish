class UploadTracker < ActiveRecord::Base

  validates_presence_of :upload_week, on: :create
  # validates_uniqueness_of :upload_week

  has_many :photos
end