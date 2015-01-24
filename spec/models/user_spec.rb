require "rails_helper"

describe User do
  describe "validations" do
    it "is has a valid factory" do
      expect(build(:user)).to be_valid
    end
    it "is invalid without a username" do
      user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
    end
    it "is invalid without an email" do
      user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
    end
    it "is invalid without a password[_digest]" do
      user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
    end

    subject { build(:user) }

    it { should validate_uniqueness_of :username }
    it { should validate_uniqueness_of :email }
  end

  describe "associations" do
    it { should have_many :photos }
  end
end