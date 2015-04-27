require "rails_helper"

describe UploadTracker do
  describe "validations" do
    it "is has a valid factory" do
      expect(build(:upload_tracker)).to be_valid
    end
    it "is invalid without a upload_week" do
      upload = build(:upload_tracker, upload_week: nil)
      upload.valid?
      expect(upload.errors[:upload_week]).to include("can't be blank")
    end

    subject { build(:upload_tracker) }

    it { should validate_uniqueness_of :upload_week }
  end

  describe "associations" do
    it { should have_many :photos }
  end
end