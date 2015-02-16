require "rails_helper"

describe SessionController do
  describe "Get#new" do
    it "renders login" do
    end
  end

  describe "Post#login" do
    it "sets session[:id] to user.id" do
    end
    it "redirects to root path" do
    end
  end

  describe "Delete#logout" do
    it "sets session[:user_id] back to nil" do
    end
  end
end