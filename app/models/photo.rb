class Photo < ActiveRecord::Base
  validates_presence_of :title, :user_id

  has_attached_file :photo, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
end