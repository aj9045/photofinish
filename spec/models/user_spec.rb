require "rails_helper"

describe User do
  describe "validations" do
    it { should validate_presence_of :username }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should validate_uniqueness_of :username }
    it { should validate_uniqueness_of :email }
  end

  describe "associations" do
    it { should have_many :photos }
  end
end