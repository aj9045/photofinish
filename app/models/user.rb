class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username, :email
  validates_presence_of :password_digest, on: :create

  validates_uniqueness_of :username, :email

  has_attached_file :image, :styles => { :thumb => "60x60#", :profile => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :photos, :dependent => :destroy
end