class Photo < ActiveRecord::Base
  validates_presence_of :title, :user_id

  has_attached_file :photo, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  def self.update_datetime
    photos = Photo.all
    photos.each do |photo|
      if photo.this_week == true && photo.last_week == false
        photo.this_week = false
        photo.last_week = true
        photo.upload_week = (Date.today - 7).strftime('%B %d, %Y')
      elsif photo.this_week == false && photo.last_week == true
        photo.last_week == false
      end
    end
  end
end