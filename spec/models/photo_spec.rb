require "rails_helper"

describe Photo do
  describe "validations" do
    it "is has a valid factory" do
      expect(build(:photo)).to be_valid
    end
    it "is invalid without a title" do
      photo = build(:photo, title: nil)
      photo.valid?
      expect(photo.errors[:title]).to include("can't be blank")
    end
    it "is invalid without an user_id" do
      photo = build(:photo, user_id: nil)
      photo.valid?
      expect(photo.errors[:user_id]).to include("can't be blank")
    end
  end

  describe "associations" do
    it { should belong_to :user }
  end
end