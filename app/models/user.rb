class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :username, :email
  validates_presence_of :password_digest, on: :create

  validates_uniqueness_of :username, :email

  # has_many :photos, :dependent => :destroy
end